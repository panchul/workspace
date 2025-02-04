[Home](Readme.md)
# Plotly Dash

See Also:

  - [Dash](Dash.md)
  - [Flask](Flask.md)
  - [Javascript](Javascript.md)
  - [Jupyter](Jupyter.md)
  - [Matplotlib](Matplotlib.md)
  - [Pandas](Pandas.md)
  - [Python](Python.md)
 
Homepage and other useful pages: 

- [https://dash.plotly.com/](https://dash.plotly.com/) 

- [Resource sheet](https://go.plotly.com/l/719653/2023-03-14/259vw4/719653/1710187267GwC6mzZt/Intro_to_Plotly_Dash_Getting_Started__2024_.pdf)

- [http://dashcheatsheet.pythonanywhere.com](http://dashcheatsheet.pythonanywhere.com) Style sheets

- [http://wasmdash.vercel.app](http://wasmdash.vercel.app) Sandbox

- [https://dash-bootstrap-components.opensource.faculty.ai/docs/components/layout](https://dash-bootstrap-components.opensource.faculty.ai/docs/components/layout)

- More samples from Plotly: [https://github.com/plotly/dash-cytoscape/tree/master/demos](https://github.com/plotly/dash-cytoscape/tree/master/demos)

- [demos from cytoscape.org](https://js.cytoscape.org/#demos)

- AG Grid repo, with nice fin data visualization: [https://github.com/ag-grid/ag-grid](https://github.com/ag-grid/ag-grid/tree/latest)

---

**Contents**

- [Installing](PlotlyDash.md#installing)
- [Bootstrapping](PlotlyDash.md#bootstrapping)
- [Deploying](PlotlyDash.md#deploying)
- [Web Sandbox](PlotlyDash.md#web-sandbox)
- [Components](PlotlyDash.md#components)
- [Tutorials](PlotlyDash.md#tutorials)
- [Miscellaneous](PlotlyDash.md#miscellaneous)

---

## Installing

---

Examples:

https://plotly.com/examples/

---

## Bootstrapping

---

```bash
pip install dash-bootstrap-components
```

---

Quick sample:

```Python
import dash
import dash_bootstrap_components as dbc

app = dash.Dash(
    external_stylesheets=[dbc.themes.BOOTSTRAP]
)

app.layout = dbc.Alert(
    "Hello, Bootstrap!", className="m-5"
)

if __name__ == "__main__":
    app.run_server()
```

## Deploying

Some working snippets in the [sb_python sandbox](https://github.com/panchul/sb_python/tree/main/plotly_dash)

---

Here's a video that discusses it:

https://www.youtube.com/watch?v=Fm7DC-Z5R7A&list=PLYD54mj9I2JevdabetHsJ3RLCeMyBNKYV&index=5

https://github.com/Coding-with-Adam/deploy-app2-example

They want to create and activate virtual environment, [venv](Venv.md)

```bash
python3 -m venv my_env
. my_env/bin/activate

pip install -r requirements.txt

pip install gunicorn


# make sure to have have server = app.server (a Flask thing)
# try it out:
python ./app.py

# save it for later (like `pip install -r requirements.txt`)
pip freeze > requirements.txt
```

They use [http://render.com](http://render.com) web portal to deploy it.


But it would be something like this on a throw-away cloud instance:

```bash
git clone .....
pip install -r requirements.txt
gunicorn app:server   # app is the name of the file, app.py
```

---

## Web Sandbox

---

http://wasmdash.vercel.app

The default demos is verbatim:

```Python
import dash
import pandas as pd
import plotly.express as px
from dash import dcc, html, callback

df = pd.read_csv('https://plotly.github.io/datasets/country_indicators.csv', sep=',')
external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']
app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

available_indicators = df['Indicator Name'].unique()

app.layout = html.Div([
    html.Div([
        html.Div([
            dcc.Dropdown(
                id='crossfilter-xaxis-column',
                options=[{'label': i, 'value': i} for i in available_indicators],
                value='Fertility rate, total (births per woman)'
            ),
            dcc.RadioItems(
                id='crossfilter-xaxis-type',
                options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                value='Linear',
                labelStyle={'display': 'inline-block'}
            )
        ],
        style={'width': '49%', 'display': 'inline-block'}),
        html.Div([
            dcc.Dropdown(
                id='crossfilter-yaxis-column',
                options=[{'label': i, 'value': i} for i in available_indicators],
                value='Life expectancy at birth, total (years)'
            ),
            dcc.RadioItems(
                id='crossfilter-yaxis-type',
                options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                value='Linear',
                labelStyle={'display': 'inline-block'}
            )
        ], style={'width': '49%', 'float': 'right', 'display': 'inline-block'})
    ], style={
        'borderBottom': 'thin lightgrey solid',
        'backgroundColor': 'rgb(250, 250, 250)',
        'padding': '10px 5px'
    }),

    html.Div([
        dcc.Graph(
            id='crossfilter-indicator-scatter',
            hoverData={'points': [{'customdata': 'Japan'}]}
        )
    ], style={'width': '49%', 'display': 'inline-block', 'padding': '0 20'}),

    html.Div([
        dcc.Graph(id='x-time-series'),
        dcc.Graph(id='y-time-series'),
    ], style={'display': 'inline-block', 'width': '49%'}),

    html.Div(dcc.Slider(
        id='crossfilter-year--slider',
        min=df['Year'].min(),
        max=df['Year'].max(),
        value=df['Year'].max(),
        marks={str(year): str(year) for year in df['Year'].unique()},
        step=None
    ), style={'width': '49%', 'padding': '0px 20px 20px 20px'})
])

@callback(
    dash.dependencies.Output('crossfilter-indicator-scatter', 'figure'),
    [dash.dependencies.Input('crossfilter-xaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-yaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-xaxis-type', 'value'),
     dash.dependencies.Input('crossfilter-yaxis-type', 'value'),
     dash.dependencies.Input('crossfilter-year--slider', 'value')])
def update_graph(xaxis_column_name, yaxis_column_name, xaxis_type, yaxis_type, year_value):
    dff = df[df['Year'] == year_value]
    fig = px.scatter(x=dff[dff['Indicator Name'] == xaxis_column_name]['Value'],
            y=dff[dff['Indicator Name'] == yaxis_column_name]['Value'],
            hover_name=dff[dff['Indicator Name'] == yaxis_column_name]['Country Name'])
    fig.update_traces(customdata=dff[dff['Indicator Name'] == yaxis_column_name]['Country Name'])
    fig.update_xaxes(title=xaxis_column_name, type='linear' if xaxis_type == 'Linear' else 'log')
    fig.update_yaxes(title=yaxis_column_name, type='linear' if yaxis_type == 'Linear' else 'log')
    fig.update_layout(margin={'l': 40, 'b': 40, 't': 10, 'r': 0}, hovermode='closest')
    return fig

def create_time_series(dff, axis_type, title):
    fig = px.scatter(dff, x='Year', y='Value')
    fig.update_traces(mode='lines+markers')
    fig.update_xaxes(showgrid=False)
    fig.update_yaxes(type='linear' if axis_type == 'Linear' else 'log')
    fig.add_annotation(x=0, y=0.85, xanchor='left', yanchor='bottom',
                       xref='paper', yref='paper', showarrow=False, align='left',
                       bgcolor='rgba(255, 255, 255, 0.5)', text=title)
    fig.update_layout(height=225, margin={'l': 20, 'b': 30, 'r': 10, 't': 10})
    return fig

@callback(
    dash.dependencies.Output('x-time-series', 'figure'),
    [dash.dependencies.Input('crossfilter-indicator-scatter', 'hoverData'),
     dash.dependencies.Input('crossfilter-xaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-xaxis-type', 'value')])
def update_y_timeseries(hoverData, xaxis_column_name, axis_type):
    country_name = hoverData['points'][0]['customdata']
    dff = df[df['Country Name'] == country_name]
    dff = dff[dff['Indicator Name'] == xaxis_column_name]
    title = '<b>{}</b><br>{}'.format(country_name, xaxis_column_name)
    return create_time_series(dff, axis_type, title)

@callback(
    dash.dependencies.Output('y-time-series', 'figure'),
    [dash.dependencies.Input('crossfilter-indicator-scatter', 'hoverData'),
     dash.dependencies.Input('crossfilter-yaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-yaxis-type', 'value')])
def update_x_timeseries(hoverData, yaxis_column_name, axis_type):
    dff = df[df['Country Name'] == hoverData['points'][0]['customdata']]
    dff = dff[dff['Indicator Name'] == yaxis_column_name]
    return create_time_series(dff, axis_type, yaxis_column_name)

if __name__ == '__main__':
    app.run(debug=True)
```

---
]
## Components

---

github.com/plotly/dash-component-boilerplate

---

## Tutorials

---

Neat, from Plotly's community manager:

https://www.youtube.com/watch?v=Qx5eFVUdDxk&list=PLYD54mj9I2JevdabetHsJ3RLCeMyBNKYV

---

A repo with samples:

[https://github.com/plotly/tutorial-code/](https://github.com/plotly/tutorial-code/)

---

More examples:

https://plotly.com/examples/

---

Some random Indian guy, but has useful info too:

https://www.youtube.com/watch?v=Ma8tS4p27JI&list=PLH6mU1kedUy8fCzkTTJlwsf2EnV_UvOV-

---

## Miscellaneous


---