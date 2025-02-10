Return-Path: <linux-leds+bounces-3916-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0FA2FB65
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 22:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 825F73A328D
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 21:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0491C07F6;
	Mon, 10 Feb 2025 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TPIWGN0d"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC4512CD8B;
	Mon, 10 Feb 2025 21:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221676; cv=fail; b=On69q3JnuNX3ng07LAhQxL4BJDMQ6KgmZ8/ZKygZn5XNqQB9CExJyKQcjU0RPR+AcRKVq9Nkb5IfuLKaRtzZF23j0C2Rf9xD4/6z3Jp+CWMD4uf7EIaieIQxlG7D8xJqqcWENQ+4I6u7LIui+neXGgjuHWQIUZYyl/0SumyVqgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221676; c=relaxed/simple;
	bh=L2VXuBCueTP3x3hooo+3Xo+Ro5QhDuOrxsANr4Og7r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CvIfnVGSPVS0+CjEoNbuehJc4S0K7la4EK5NLlzXt0udYc8i0IugTL8n+Qhw5t0L+/CusEnlhHiAUqoDZ4qScOX3U3f6Mc7QUSmU2VXYccVj8GpMkz/dx9/bprBz2kHpgr+/lbFjK8zsKug9aNRgbvgPwRm4Ahzo60qXUD+k4IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TPIWGN0d; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwUynVZp46Zo7Ff+RiLp6pF1h6Tvx/I39Yyrzp9gjBGi5VUHBGlViqI6dZ/RUh8fsHWts+DAgQJyUOmiLOol+n4/iI9o0mAhSmKjxuDQzZ9qd9RVjjLzet5TdJV3bys86rYQxlKw+DXHN6SJenMpuENApSLdxvgN9TXXKv3jwRI20xc1PHOTtMvxmK7nvTH1rvHe9H7OVELbcNmvUzhSaxiY1Dt8NJ/a/S/Cd5FKx41Ap3zZ0qvSaXNlVxasG8wKHpJAmza+eGgShf/L/b59+ITfwh+q1185H7Cc6xRyapRTPB14K3b8YIvwHzQO3X5mKKHELVk1MaMXeGy7cYSqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/NXzQ8aNzW1uGbrrFFU60tBHC0pU8ETFL8Ioafg5lE=;
 b=FiRC8SwqWOvtFn3iBdJA8ou48uKqWCP0qK0UssJhGN5B8u3ANCtF4Mj+QKvjATqQCV1gyEvmfiqRU/RnR3L83x1fGoiZ0TH7Mp+Mj8Ebe0yUkA/EibYEAYJohYvsmiR/bfHOw6r/ImSo1X7gsexe5UElnZpbUEqxzPxwR6naXwssupCyBS66zPGeZg6KxGJtYMyi07AXBxVAAht3eKEdZqy4KX2Xgcij6SGHR873uwytnJWUD78yZPwOKdMsMk3o5ra8hTzGO4/DaaS2Go2SFX1/EavJBzfXQ8JWbAOIzWRMSkW6Pefors4d3G+olfpgEpxh4pxa+lJocky5A//6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/NXzQ8aNzW1uGbrrFFU60tBHC0pU8ETFL8Ioafg5lE=;
 b=TPIWGN0dmf3Ymy7iyj1vRqvy67QnuKgmLI+hioMBm/FY/toDqzfQOWxaDF3cOId3iOT4wzZ+wZs3/Qi+pNgZ8jLGv3vPa1xrA9iO69vBLkJC0aKoHCbleVlHzvawzZNdxiFv3941Xh9E5PsV900MIs05PEfiTlGkDovkXxZez/6JECx8Zwnd8hk6Vs4c1xXjM0PSlnOGjbtME7f00FWgWuZo1zJri2EqxnJJBxo7CXqSZoA0i5ntylsYcHcs43AjlLUTDZZXhrnAi6KFVrMz7UWVC4cnJe6XtKSgkkBdjYMbBrwMzHD/rZMb11bFy2TZnZjwhXZXF5Q8lg9+AYMOlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11223.eurprd04.prod.outlook.com (2603:10a6:d10:170::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 10 Feb
 2025 21:07:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:07:51 +0000
Date: Mon, 10 Feb 2025 16:07:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to
 yaml format
Message-ID: <Z6pqnw3WBP7WRfYe@lizhi-Precision-Tower-5810>
References: <20250107161628.121685-1-Frank.Li@nxp.com>
 <173627580718.1304322.7908676202048945270.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173627580718.1304322.7908676202048945270.robh@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11223:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cbcb84-5c01-42e1-88c4-08dd4a16fab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMdoDqD7ajLlXplyz/d5eR9OBPAab4KkZjDJ43evgOgnHKLBFaBbyf6jHPRj?=
 =?us-ascii?Q?GGpv1NW9TD388NIlyVM9cctfz2l4cIX19jVcnIxUsfZYyv6vf4koKG2x6339?=
 =?us-ascii?Q?ce3bZKUA5WHb3dLdAh2J0ksyZOk5g5Ri1o/Whtd+Y7rYUJONWIEbdrVfcXK4?=
 =?us-ascii?Q?rWDPSmw5+m0qCdnrGcooNKRulGySQwlcnTD4Mx7GglZo3zh0F1iYYUKsdcCI?=
 =?us-ascii?Q?PahKUxWCw/6y8Z0/VatnvegfyhSfYO/LlWmFyhOCLGn4FsGM9SBpmmFbqrnB?=
 =?us-ascii?Q?iRJWkdX3l4qQlkzgmATOeqK4/oav0GnTIp10eKIkWY/T6JW6q5qApOkVj4NB?=
 =?us-ascii?Q?3BA+mWmEdOeMvajcVCt/ECKndF3HymRgsCpdFSeL8+WlIO1q9o4N8aPiVGsN?=
 =?us-ascii?Q?hPwSaOZJQk7l+wb5ZqkXJirvVqP3tY3zMvIu93XdjuRdluB/odju/hW0naMH?=
 =?us-ascii?Q?wGxy5LlkIw/4L4Xo4bItgf7XfeSnsnYW1hruhPqG3y2RPiEgMhgzYGkiM1Rq?=
 =?us-ascii?Q?IQUzf/QuQFcZWNItxfd/8BqqhiRQSbryc5pl9ARfCOjXJcOjMjuPTDxz9sAz?=
 =?us-ascii?Q?7FnjKHI2/A855n8bOV8+v1BU5Y5WS4yHY9Frty22BACClWKUc/FuqWe0aLxT?=
 =?us-ascii?Q?AL6MQFvZp6hcnzOU0igdhbfoI9VRKA1Kpcia4ujUegCBzjYx4tkFucf4dp77?=
 =?us-ascii?Q?zW/JOzse4XAlYbPLjyA4N5HRMyD2hCRvgpSFIwzth+h+z0B4EjskMooVGkFO?=
 =?us-ascii?Q?ogRm48+iKvyZVvJ9WotLlIooUddjF2CmMnZo9WjyWT5pugXpUKT4S4lK2Nwi?=
 =?us-ascii?Q?rBAkMPKjZ6IjnkA5+FgowGpaWsNQA0dYgh3IbZ9nX4bJWpVEiSi1tvd70Ulj?=
 =?us-ascii?Q?C5jWvNXv+HS64C5zvHMa69/eWzRKN/gCuuRrLsbhrkDMsD7d94Cls28af3f6?=
 =?us-ascii?Q?yw14Lzu56l8QmISDOHyvcVxcfp/lFJCaPqFN4dM34kyIK+bxVx4nX3Rc4VBu?=
 =?us-ascii?Q?qdw1iAtTveJM5+cABO63VLznhsKvvwaNOrR23cfy9+T6eutxmq5ZOeE3Bidk?=
 =?us-ascii?Q?pptsZe56M0FMhOmisxALCHiEbM6YMwnpjjxVVuJE0AWWCI3mGs1OevLUeDzl?=
 =?us-ascii?Q?LdbX/JwMKXXmxeFDPS0auoNnLCsmtNGh5qgjlPRP3qckvuqZta5PivDiQNQX?=
 =?us-ascii?Q?dLrC8O67wfByNby8O+dzBYEtFpCHxUNPZoEKyqH4pN6iBlenXRc2xmK8lB0f?=
 =?us-ascii?Q?BaRD6tXb6JBka+W6mVDyPK3MFONyVhg0yzu0t6oHgju+vHgsnUW2Q3hReooa?=
 =?us-ascii?Q?FgPMvmc2a4wjm16CuigVYZK9D0R/sNdyzad7O+Z5P8YQ6S54JCpajAaKxB7F?=
 =?us-ascii?Q?bYlnWnKaUdyAVuF3imDYLZ4LmBrFwWxFh+8dZWp6TsctC3hhdJyTdbtAK6QI?=
 =?us-ascii?Q?kHFVUD7RXKHbIhodrBuq0Qb/F3Q07bMH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQC6V6o0buLIeCEjGVgNTDC4dNSOIjbnpEjfVhz3FxHZsQTyNivC7HIhm1yb?=
 =?us-ascii?Q?vQ+h222K0L4eowfR5kAnDGwJdPXwZlSqaiAxn0hM8E5srZe2u9Effj2wSAd3?=
 =?us-ascii?Q?YOGWYdHJZ2WSRX0AAX8WS88HocqLXV5RwGb30xzRjIahwH/5d+kx7P8hjNmN?=
 =?us-ascii?Q?D2kYa6r1JBc8Sosn3OxBFe/odNKja7kJg+vdyu1m9or2ZmuicUhYehip1nh1?=
 =?us-ascii?Q?lEnpfWEZ4vLshZ/I6M3Mp9zEK0hG/8NKcqJjZUqs2XrvsxdTroqv1bpX8Kft?=
 =?us-ascii?Q?sc6uinJrkHMAt64xrWTZwv1IbI4khE8B0l0coNp4PCtYy10H/3MnffZ17rGC?=
 =?us-ascii?Q?Dx6ViOy4ju98FdCcSHkwGwGokoYwjc/7bTp5lmUpDelIFBT5e4OK8Rxd2v9J?=
 =?us-ascii?Q?71r1ncr1FauyAjVCaUvAfZktYCDu3XzJXFYSO8tUUhzHxvraZRm3Q7tjTu4O?=
 =?us-ascii?Q?n+KSqAduIU++kmjD0aFFYMnLfwFpQYHvtKvHkj8/E4A27csSbK/Wh6ZpZNCd?=
 =?us-ascii?Q?lZ3ah9e8CYFcSdg36FoAqBKRZyex1bNIbnC2B0aBdBwslq7EvpTPMDd0n/Xg?=
 =?us-ascii?Q?7ID+oVYUpwpxaijSIwzvrlQOw6D8mNz8ePRlyPPSuupppNu65GDR84dxupL1?=
 =?us-ascii?Q?NFGVJnneBi6/Qkrt6lKC6FQAah9iKkilv9BsDhBPRTYgSgQjpxiN52pUucl4?=
 =?us-ascii?Q?1lAXaFGXSny3BqSdbp78rL3nQK0Ip9eAJHErn0weU3vKJ1XCg5XdZB7QgRSq?=
 =?us-ascii?Q?rIdtf6Ee+4fiG3wwud/CjzmgD+W9ycCW0wRK98W99QGmtj2y4/eSjnxmenD9?=
 =?us-ascii?Q?u1R4zRLQJxjcaCFdw4ilDj6MozntG/83MD15ZKWnnYruNe+yN9fEoab/z5jX?=
 =?us-ascii?Q?TjyI1L/mwQR/nXox6USxm2MpZlKRFM7xcMmcmS6AUJmRT5sb1iFDU/7b8Zg9?=
 =?us-ascii?Q?S3pLe2vPfBGEnCMgOkaeWkDL8gsjg2vPDpH+Wm9rMSgP0hMVDVv+oSdAo+5d?=
 =?us-ascii?Q?A1wr/vKdSEqI+zGxFiZGo/5rFktH6XmhYIjTnG+Tcz3+sZsHV10OrZTZigYN?=
 =?us-ascii?Q?jrWmtCC+f8eMOSV7TIRKvH1yjd/4QoGUQK1LKodO9VjWAC3aOP7w6JLnWXnN?=
 =?us-ascii?Q?Hdhg3M223TnDAXkRWG8+CAQz2sHhX3dFfCKHwAOvXRv+YulcWUhN5nP6qDZi?=
 =?us-ascii?Q?R/fEG7WPjoRxg3tv1CyWzY+BjN4HldX068AqDjTPaOhkVUHT+RCxxCcmE0iv?=
 =?us-ascii?Q?ypCmDnrmTzjCuGai/cpN0fTKvEeH4e05LwgVkRK4sUup+hr86SPMGoobJ9hv?=
 =?us-ascii?Q?AxuTbp0yEIzqG2tOCsJ40R89Cg7SiIOsAob621CrSmcZWM3IxQKy5vxv9jVG?=
 =?us-ascii?Q?6Umb3KWS6KM7Phj9ZDzfE3suVe/3UzHeNOt7qfBx/6oecjHk/Tg8poy4d5om?=
 =?us-ascii?Q?a6R/CTPNsTCr02bb5vZtPcK82wQf7+2LIW3FNYQMLlGyYjsrSECsPnknRzbB?=
 =?us-ascii?Q?viwADgkg+A9vQpcFiqSBGZDy3ET6/oky8smw4u/mlpfazPJQajT0idswM55p?=
 =?us-ascii?Q?i9/t/MGZRi7YNwsnNKMOjU+IztFjZ4ZtvNj54p4h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cbcb84-5c01-42e1-88c4-08dd4a16fab2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:07:51.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TO+yGNxesqbUOQ3AtQe9SpXZH3JlMDSZuF6IAQPWXr37FLR9IA0eOcMCk+igtVEVY5UCnBqu6vfbCWTwnGXUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11223

On Tue, Jan 07, 2025 at 12:50:07PM -0600, Rob Herring (Arm) wrote:
>
> On Tue, 07 Jan 2025 11:16:26 -0500, Frank Li wrote:
> > Convert binding doc leds-tlc591xx.txt to yaml format to fix below DTB_CHECK
> > warning.
> >
> > arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
> >   /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
> >
> > Additional change:
> > - ref to common.yaml for child nodes.
> > - limit child's reg to 0 - 7 for ti,tlc59108.
> > - fix typo 'linux,default_trigger' in example.
> > - change child node name's prefix to led-.
> > - change nodename to led-controller.
> > - fix properties order in example.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v1 to v2
> > - using "^led@[0-9a-f]$"
> > - remove minimum: 0
> > ---
> >  .../bindings/leds/leds-tlc591xx.txt           | 40 ---------
> >  .../devicetree/bindings/leds/ti,tlc59116.yaml | 90 +++++++++++++++++++
> >  2 files changed, 90 insertions(+), 40 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Anyone take care this patch. Rob already acked.

Frank

>

