Return-Path: <linux-leds+bounces-2498-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72695A2F9
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 18:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14B811F22662
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BB3152199;
	Wed, 21 Aug 2024 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PBTuInDO"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013048.outbound.protection.outlook.com [52.101.67.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8FA43AB2;
	Wed, 21 Aug 2024 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258252; cv=fail; b=Jty5BmqswuPVVDUlEFiyZn3QTtRLLCu6Ad6dmwEPG/edKx1tKWW8Xc59gY9uYRRhqgXNNFrG4EjjH4SNqP3vJ1Qxeb9ZL7th1x1f2XoQ9lRc2Xu019HM73LABPmRb5b7oMFFgFPKeEBFtlV2vU1GJcvtT8sNepXpKkSVx0LxQeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258252; c=relaxed/simple;
	bh=d/g5nldxgN2LQrkK1IyQtGtr27U0F7n5JdZt5ux0GOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gXImTZ9S+Zdu0QLMKD6w+iHY37K8pINrmt6As3irvwgop7JXyETmpt5H11Ke6MHnYQXZJrGI2v9USuydg7yuDRhsMMtlyBxjMKQ1qf6SaVQkfkzNJakkDYN8n8ReSs+o5W7q4H8RWh+nEYjThI9UQ07jsId4Vdqcx3+anFFXwjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PBTuInDO; arc=fail smtp.client-ip=52.101.67.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vszHKE8ARG3yKRAWTg/16QzTxrW9EiFbNVr6WkRLG2oYc845bLvN4HNecFglRwvpCjJWtGqtfbZpD9oEf1f1yff1kwMcG32pGfa2k51zB6+oL5TJaCLE4EKqGlz7/HoI+JDMYLfRokTuT64MEabC28HUZZ77O9C60w1f9W6yR4Y/6LWtVufh1DI290Jkz5XhqslAUxf9dz8NGWrXHd0Pw4XyypC5wxa6MXpyWFi1F/0OGed+bfOzxQhAfz5RZTvwQnDrA8hE2sI239B8HlPfRc3OgtjdekytKLx+qohyEw6uFRranp6rR8ey63jqPXTkEzVhE1rKrIiVAm0Bjp1EIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L7UqnidacFQvAQHcHUP9rDvw74US0EGl5i6UKPEfi4=;
 b=rzdz0R+ICOr1IUrytMv54n7WztuLXZ9P+eWToxKBuC+Fq9rlolGBvF3BjLifBdUVblyf/gB4Q9/sHWHZmSuEZlSAVxWUXHN5eZG/UR/QTxr/9B9rVJzIJSUuInbB7q2wrzDvjGJ91sPcHIaR2quRdQbi2hQGDqTI+zGvx42mrUD0J90HXC2Qt84UFdbGI8LyisF+A8BDWIibbfe8dM+945QiRlms69a7c2D+HtHnU1oLeRvLSn0DhbfKteIklDTBA7o+9w99meqb0Q12hsMViQNr/kTbE/tAmRDpoBzDqhQa+9pTkNufCowtEotcBHMGlWNx0z8LpQuIRZOG4X/Maw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L7UqnidacFQvAQHcHUP9rDvw74US0EGl5i6UKPEfi4=;
 b=PBTuInDO+G7jtB6qe2DZZX+kGcSPjE2R2a4LtP3uyU67q5FZbtIFMFFkvjhmxnKis3ttdY0KuDNyGtqGXiRzdxjIzR7IsZJBLrRfN2VjpH3qpVceEgJiBXoP+tnWv8q6xVJyF7DNLd/LZrgvqxAMfRA/r/ScYsPjT1pV49D/DWbrH+ol5cam3RqFLn/vxBpmBVrBmHGR5My/P0km5sRWkYkxuMYMEyXgfKp1lluHtmfQ1KyGxmqHYWvPa1zWEcnqsA53Dku42kBiKgs5LS5EFwv1HNbp89NDFnrKCe+3W1lGep+CbcyOkPiPAHX7IQLD3umKOAg6OxoUj1In7In+gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 16:37:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 16:37:27 +0000
Date: Wed, 21 Aug 2024 12:37:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	"open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: leds: convert leds-lm3692x to yaml
 format
Message-ID: <ZsYXvvhNxmXQAIVo@lizhi-Precision-Tower-5810>
References: <20240820183544.496419-1-Frank.Li@nxp.com>
 <20240821-sizable-jumbo-1a114a8cc53a@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821-sizable-jumbo-1a114a8cc53a@spud>
X-ClientProxiedBy: BY5PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce40974-9b82-4966-33cc-08dcc1ff8ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CQyLBbkQYa3bXvptqAG+0Qiphdf9Qh6mlN86I/2slDTLIR8Kx3BuPXz09Y7H?=
 =?us-ascii?Q?vZCWX6lVgczBlOCAsg+/evyIqaSqfLBHh+O3610rXjOV2zgHpMAdVgdy0k0I?=
 =?us-ascii?Q?I+QDDmGZNzCWAKu3L8lLrKKe1yWvcZYgIr2h7SjyhTmqONOghr3eL7SMIJHV?=
 =?us-ascii?Q?fJR8+g9InAdRNuxDC3dQ7aLk8sK3n7KpE6rSUKfAjiB57Pb9AVTjLiLYNqil?=
 =?us-ascii?Q?EBqFLcynsSe5ufAd2BS3y1RWeIzYOlJwkOkzVMNs26dpNkH+3o3HqbBz48Bx?=
 =?us-ascii?Q?aNloEfX48zCFPEjfHfwy/pckfw0dIQYKHe+1Y17tG2c8R8T6fPTPuELLucbe?=
 =?us-ascii?Q?v0hW/d5Z5JbK6HolTybjNGeQhjFVMkXqkrkVv5tiqXbfyfCNkpukNau8tT46?=
 =?us-ascii?Q?MbpTFwtML5qxz03xKTeYvaSW5NCrYZpiqUMajPz6txnhjJuSRtPlkzXozP62?=
 =?us-ascii?Q?7hwY0kX3pgogci+Gxx7xVBasVTi2qr3AkPbuBsvaPUpcpeV6ZTnzE1UNElkk?=
 =?us-ascii?Q?AgiDh4kE7aHeXRZtyYfJUDrc3SprUpXHlMDC3tFhCp0iEF5UUp+YPtgDAvQo?=
 =?us-ascii?Q?ovqEzdl/n9PsMU29/7Q33luhlMX4issZU77bg4Lt9baPUY8prq9FA8Sv1cMi?=
 =?us-ascii?Q?OT8zpOwAtTtyoFDHIac4UraZ1HO6/7gG7gflYYeVHc2zGzE9Z6DWGbOrmA9h?=
 =?us-ascii?Q?mKbUb0BLJiEw3DDCQctZq+eoX66jsBvCu2nAU+rmg3P2bK39Lf9Sma5fhjiC?=
 =?us-ascii?Q?CvYjhbD3kbsu5UN4aDCXQK988C1foC4md0L0fqo5ZeNL+aUzyJa19/rbIIop?=
 =?us-ascii?Q?Tqxs36C2MB8FQ9AAQLiV4BKG4JyE+xDCrFBzK1c1i2dso8YsPDTJFK6Jww7x?=
 =?us-ascii?Q?WCEa6pm6/z518q7V1MMzrAwfpfjo1t8IYKHMI7rNZ4OcR90sNBVO/wr8MKTb?=
 =?us-ascii?Q?elDxf+0S3mrV0UBixoWaz8Yw9lzYX7SeiMayEDt4BOAhZNB9YJi4O6Zc+oZ9?=
 =?us-ascii?Q?8U/0Ivo+8AwDNINjiBGYSgn+mcUpjyRzgdBe9gQvrMP0JXDTDjrT86t0JtDn?=
 =?us-ascii?Q?804Pl1FVqegCZc5gcgjwc5P07d7H4V54GuujY0vuAoA5VX1JEv9s7oEhFw90?=
 =?us-ascii?Q?ZE4dQji0IAg1t79KDIHofclV8TB8fgpsEuQBriVvi3imxLy5NYDrwIAsE84o?=
 =?us-ascii?Q?pyYQmQvW/laiFngqS/jMF9lRIliHt58eAvffhpUqe/XLW8yFYtSDouHdK3fe?=
 =?us-ascii?Q?riQqiU/sdKomXsO2/vqKhEpINmBe5y3pt5uyfnBM5/6vaDnLefpcHQUrrzB2?=
 =?us-ascii?Q?WlSR/yYJUV9JBD00cWT3L2XFZXOomHkmkYQzSxWfho9owUICG4QKBXkLHmry?=
 =?us-ascii?Q?kKsfku8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZtQ+ksspC5B8DAE9JcTlvpwrdMqn3kWtWRYz/Faa1J6Jq+qiTzv6LwbN3z5l?=
 =?us-ascii?Q?FSX2hS63lyifcOvPRCdaaQqH/LbEjhuhdQYIXvTcH59xu3/9ct429psgA2Dh?=
 =?us-ascii?Q?alwq0Ef3kWroBeiOdK9oWqcWtIK06l4aNRFzrmfWW35FJPlSz7cn+nhiB8l+?=
 =?us-ascii?Q?c/GJ6KPBASd0lXl5avl04ILSUvxwzR36XvSf+zARuk9CvS/hRWkJP28J06+a?=
 =?us-ascii?Q?MAtQDfWm/J1zfJr/Tkcl4+j3cLxejReYhOjWj+ogR2SVbfqsh12zfLpqCV2f?=
 =?us-ascii?Q?/bPq9ZolbUJEl+XLYiWAtkDvoDR0P6hiyQojwwnu9pdvvXRPpGcNBaEm8moO?=
 =?us-ascii?Q?TfuclMa+sphUIYbFqtuXNvT0fCg7QwpKwqYjJVV+4ygX1awC0OfQ+wc5JPfo?=
 =?us-ascii?Q?ABbvVwAfjWG+C3OnW44pvwtiEZNr21yX0RL9QRnGmUs7AKlWOlbQ0toInm59?=
 =?us-ascii?Q?nXXbr7AfANnRrXlkW/42w0pp2GsSMAC/dyix7HBSrLf+agzFJDuMqq/U1bb1?=
 =?us-ascii?Q?t/StGjV6W0m8jEuzAHAMcWbTHF0NVo5HrfuczKpFowRm1OHUtN4/BW7eAiSR?=
 =?us-ascii?Q?WhmdwLb29b0FLkN6d2bqJSq4JZo199GvmR5EAKF3jKl4ZVsEVCHbuvk3RdFM?=
 =?us-ascii?Q?OAHLzSc1qQxs8DdYE86seAAeOdEQt8LXFLJPHhz5sciga3pv5a1qygljU6Ws?=
 =?us-ascii?Q?8RsglwJegRxG3Fg6YzunetGIjWXbaFsJd2zGxbRF6/X0JafTs1+wuvlssdSQ?=
 =?us-ascii?Q?bSlEjpnC7nGJ93hlsXLVuaQLKHahkV6R+j1zNq5gOn95tqJtUPTFlhL9EVj/?=
 =?us-ascii?Q?+KoY5ImGBLQ6iIgLDt2gWtqHLKo828Po/l4DEAChfVUdAcT4NtzzN52ozktK?=
 =?us-ascii?Q?0FWA+YWPw+eB12IoJx/ybOkYVRkl2U4lAY1j+qAcR3XZOaGdopL0wf2gkOaq?=
 =?us-ascii?Q?fg7mwHhEKJi/F1EPhwUtlUh8rgN2lp+C3NHQkF7Edf0MK54y97YQYXR4Hvxh?=
 =?us-ascii?Q?Uzxx7Z0PdVQN8matt0n7IBqLxaxhC7thjplalpBMvAJF+zL6zIVo88svW5U7?=
 =?us-ascii?Q?4ozI/tGLvdS3gt61QKzJUgc4cyJfcp3HBmgpNsh19jRxRdLuoOsPdsO7fafa?=
 =?us-ascii?Q?wkCXqJjH2yzykB5Xl+YgQvsmQQ2dMkLySFwtqrD65TD959tpRCqIThFZgOeg?=
 =?us-ascii?Q?uMUSovt5xvCqDPrjxCGanrgp1DGGOIxGhl/wdO0iEdVp9UxgCwStzCHZKZE+?=
 =?us-ascii?Q?cpNfm4UwqW81tK77MPfcBH6Vb72lFNgM3N4o/LnieUri/n04ySguGNj1JTMU?=
 =?us-ascii?Q?9vbpqs3pCK+5YS3tn7Oh5dvqZeX0FPqdUhzCakN7QScALO0g3DNMgT3xNBSd?=
 =?us-ascii?Q?FYLMNdc7/muX22Gn1B0EWLyMjZ025/Ky1MXOXrmqpRELCx+Ht1XY2AEkgdzV?=
 =?us-ascii?Q?FcWQfco56BpacK4Qn+/KQB3M066WP+soDIRIEQ79nLomGes8aNg0kbTBTFCn?=
 =?us-ascii?Q?NSLGz1U5jmEDx/VOQxj5tj6tQhF3q21ioJ2AE7VyC9H4f7CXWv50sJa0u4WO?=
 =?us-ascii?Q?IVaOYy64pr7BL4TuxBTdTHL0BM1xldnroWC+MQMr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce40974-9b82-4966-33cc-08dcc1ff8ac9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 16:37:27.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g60XH46e23nwFpYD0LSfCM8IQBg4XRNvSvtl4QtZThf5IZZ9bohI9ZxVOppJEByIH1JoRETnLtsQ0Fe4Da6euA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8784

On Wed, Aug 21, 2024 at 04:15:34PM +0100, Conor Dooley wrote:
> On Tue, Aug 20, 2024 at 02:35:43PM -0400, Frank Li wrote:
> > Convert binding doc leds-lm3592x to yaml format.
> > Additional change
> > - Add ref to common.yaml for child node
> > - Add i2c node at example
> >
> > Fix below warning:
> > arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36:
> > 	failed to match any schema with compatible: ['ti,lm36922']
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > diff --git a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
> > new file mode 100644
> > index 0000000000000..ac98547b78bd2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
> > @@ -0,0 +1,100 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/ti.lm36922.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments - LM3692x Highly Efficient White LED Driver
> > +
> > +maintainers:
> > +  - Dan Murphy <dmurphy@ti.com>
> > +
> > +description: |
> > +  The LM3692x is an ultra-compact, highly efficient,
> > +  white-LED driver designed for LCD display backlighting.
> > +
> > +  The main difference between the LM36922 and LM36923 is the number of
> > +  LED strings it supports. The LM36922 supports two strings while the LM36923
> > +  supports three strings.
> > +
> > +  For more product information please see the link below:
> > +  https://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,lm36922
> > +      - ti,lm36923
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  enable-gpios:
> > +    description: gpio pin to enable/disable the device.
>
> I think the description could be replaced with just marking the property
> as "true", both here and for the supply. The descriptions are statements
> of the obvious.
>
> > +
> > +  vled-supply:
> > +    description: LED supply
> > +
> > +  ti,ovp-microvolt:
> > +    description: Overvoltage protection.
> > +    default: 29000000
> > +    enum: [17000000, 21000000, 25000000, 29000000]
> > +
> > +patternProperties:
> > +  '^led@[0-9a-f]+$':
>
> There's no need for such a permissive pattern here, since reg is limited

I am confused about it.  I think it at least need led@X pattern. Do
you means
   '^led@[0-3]+$'

Frank

> to the range 0-3. Additionally, I would add an
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: ti,lm36922
>     then:
>       properties:
>         led@3: false
>
> or similar to restrict the third entry instead of doing so in prose.
>
> Thanks,
> Conor.
>
> > +    type: object
> > +    $ref: common.yaml
> > +    properties:
> > +      reg:
> > +        enum: [0, 1, 2, 3]
> > +        description: |
> > +          0 - Will enable all LED sync paths
> > +          1 - Will enable the LED1 sync
> > +          2 - Will enable the LED2 sync
> > +          3 - Will enable the LED3 sync (LM36923 only)
> > +
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        led-controller@36 {
> > +            compatible = "ti,lm36922";
> > +            reg = <0x36>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> > +            vled-supply = <&vbatt>;
> > +            ti,ovp-microvolt = <29000000>;
> > +
> > +            led@0 {
> > +                reg = <0>;
> > +                function = LED_FUNCTION_BACKLIGHT;
> > +                color = <LED_COLOR_ID_WHITE>;
> > +                linux,default-trigger = "backlight";
> > +                led-max-microamp = <20000>;
> > +            };
> > +        };
> > +    };
> > +
> > --
> > 2.34.1
> >



