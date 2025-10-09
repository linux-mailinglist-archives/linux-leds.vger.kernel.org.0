Return-Path: <linux-leds+bounces-5704-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3018BC9A61
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 16:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF8461882195
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 14:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615D32EB84B;
	Thu,  9 Oct 2025 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LimE+SOI"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86091991CA;
	Thu,  9 Oct 2025 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021756; cv=fail; b=TddBpg4GnSU/H0+3rXWQ1x/Qoq2YSaKXaNHDn97Qm7cgcwmoleoK626z5hiyszTg94O0GRRD+uBxePGWLm9fzO04SbScZQ7GUTdLH1yVDwPeRTqHA3zdxnHqqbUooMmiTAZXn1fi66eSr6VRa7XEYlS9sY90w3E93fKT/8u3FZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021756; c=relaxed/simple;
	bh=kcxJ2oT/t30D/7+2HexU3AUytbkuL2bbwQ7XumEa9F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dJY3D+gQSkHn3TGIaAlW6pqHYNAyDZRm3YIOpcki9eGc/PXQvSAPkj/m38znWRO/QD9v5PjziCY5RGwdsD7wJRocrS9DpkICTfKpIW2bQwd9hiyPaiIFGGFf03sLgKgyYx9Jmeyl/TGoYWHTnHsYhw9VXHvXnKG4heeEQyehyIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LimE+SOI; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCi3pdX2E/xMRUvJAVOv0JowY9pWxHD7eUk28PCOPZLNOY1hsRNelC6RU0df+dgj2UKsfmfiv5sfyPV2A3E0DPe/caa+cl/qfxvNQP0Xjbngq29YP0gjvNpcIgnDe0ZED8oeLzkycyL56/VW2+goFURrGo2rxBLuk0s1IkxH4nkuzeBFFHeUSUs9St8XCj4XKrrjMbT4Tym+WiSuDAXyA9ggYFigCsyNwoPXK9pqj9bRaosvlDDUnUasGEXptlHFUvq5xPeR17inbk3g1Yf7QPaaYGv1mS9tEOVg0JUKh4HIlNXL0xfne2Sa+YYZ1Df0OTusOr299hNfxq5V6q6b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLChmunCSRnMw1JfoFpkn6qlUSuUPB/1kRbMajXh2M0=;
 b=T7TMZV757kkp33fJF2OJi19jdECPMl4SJ75E2HqxO1EU6kqAiafGA+MAADTJcKLi8BixA7dWekTIVQDdQg7N20X9087T7dWiRZiwxdx0X9TXcUE3/9OHuWt1hes6lyOPdTHzP97YGNOqcUch5SPTaC11V8IpKKjQmwi2Ay+jAfFVvzQj48B9R0H0KfiTWX3A8gKlY+/6BkD1Nojnjj6nKV5nuNn9mtcpOGlnSOzvYCbanwN07+99IZLIYqG1aHc9Zi2aI00RGtQjj/Ym3BoLmYw6vy167oqs42jgYyBZz1jVkI8cy0EMHGg7MF5fwysrvNVEwpFuap8vpjXzC7IS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLChmunCSRnMw1JfoFpkn6qlUSuUPB/1kRbMajXh2M0=;
 b=LimE+SOIgQVqkCLWDr3d3Er80ZERj2rpyELhWMISg2F8XXd4ENZLiPG7Jw1cxTzQ2cm9w2qBRd9+IC9EbW95uBxSnnYpbTwHwFi/g0d0dOwxBYDHiW3l6iQy/7p9m19w4K6qbhUg0CmgkM3sHKR+n4F8RAMzjDtcndhGb5iECqtRagJNqV59+dqpTGFVK5BJ6MgE51mp2zmJn1aHttYrTWA2dIRHLhMcTlR61Gh/fMZ0DQqNluEB2RGU2tSTGjoN+a7mCuhtgIVl4RdjK7VlwcKj0Kg5uf55B/Vzg2bCPwtyavnYRVy5gwgL6OBr0un9u2rQYKdgOfHyAJAcPOnbMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBAPR04MB7383.eurprd04.prod.outlook.com (2603:10a6:10:1b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:55:50 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:55:50 +0000
Date: Thu, 9 Oct 2025 10:55:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <aOfM7jnlPO77YSu1@lizhi-Precision-Tower-5810>
References: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
 <20251009-max25014-v4-1-6adb2a0aa35f@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-max25014-v4-1-6adb2a0aa35f@gocontroll.com>
X-ClientProxiedBy: PH7P220CA0066.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::21) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBAPR04MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: a34859c9-96a9-4918-b1c9-08de0743f00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+CW53xzV9Teh1Q4/MF4RaHFHQMiVeZS7c9RjfKPRr2SUv2EgVrM/JLPnTZdI?=
 =?us-ascii?Q?zH5HDZiGSbVNhGyQyDfQwhB1t//a6yoDNQJGZVny4RKYQAIpl/4PmfHW9PgS?=
 =?us-ascii?Q?HzcpNSA2O+7sP2eUKAF9jZsLEefop5R86iIDIGYU6nBC+8xmt9/z050Or4DI?=
 =?us-ascii?Q?GcNotmqnZZbB6mYD6ONOxThBH/3VtHeYg5/Zdn+tfTQRVox6C+v11NGSJ/Kc?=
 =?us-ascii?Q?amQB6tOcS7B3bkbjPJ5AAN/VruvKma7LqU821qdTKUb7wX+WOIdqXYFk775e?=
 =?us-ascii?Q?IiW7c/Xahfan4/KNtim65oe2dikn2r+Eo9m/w8xnCJDWILfWO7SD93PVwzlW?=
 =?us-ascii?Q?BY+dhCQVq1rReYoqJ2P0va+sfG0EeNuTxQA4HgNbDjGrNWnEB3XsBoTSXVas?=
 =?us-ascii?Q?m/AczGEKJPujtVGLgT4esyCmeprpCVWEi6nGAxXTWDB5qfQJlm+7H4uY4V7M?=
 =?us-ascii?Q?dfoWk8H9zGRmZb2MD/2mi72DZBLDoAe0sS24vBAYg/QedTpCgSDLr9E6nsQ+?=
 =?us-ascii?Q?roh9E6IwLGWN4u7gNQrXWwg1HbZS8LqV8IukfgE2eGZMJLoFb++XXd40i5lB?=
 =?us-ascii?Q?F8qXwq3IhlM7p0J5KeBj/R75ZyCzhf8lIxo9VsROtxhs7kW6sXMUhuVV6C4y?=
 =?us-ascii?Q?K1O/7GMbTPIYYh55gShqIMyAXUEvy/qpOkUo0rptnDKNO+ZmMfFywYj6dsog?=
 =?us-ascii?Q?OlQanpJq+N+Zo/e3/qAqCP+rEbVBM64IlpJkV4mp3xQbwg41HWIGZn+CK3/U?=
 =?us-ascii?Q?mhMmj6ECbQ3TrQB9Si9G1jIUBGK4XkpDVRul+Ojo+NnehjMk9tS72EyPUFYP?=
 =?us-ascii?Q?2RPHVtZfiLI95O22c7IN8O+BYSSBrAxHfOF2tpmekuZViY48lswFd1ge4XhG?=
 =?us-ascii?Q?+kKvARbrsPkV9VrDhwPiV4jFZq6r3owt2AtYOovY/zVykXe+YkBlVYn+ftkt?=
 =?us-ascii?Q?lqeaLZaLCwvFHCR8IepUrzHbApHxJfCSNnzfnXrgP8q9j/zmzWeVXsfjaSGF?=
 =?us-ascii?Q?wynieZpbfuPPKnXEGKqbqkPrRyJvK4M6cJsvjYuZ/ltwmWcU78i3yyi09UBE?=
 =?us-ascii?Q?9Chs/3ktyD3xD8m+0Hn1DAR7gqZd9PmoMMWt5iEOdx6cvuTmhAzjs6OEceAx?=
 =?us-ascii?Q?vXc3A/mJsa0ZporsKvLhp19ted4NOR6gcEyzQh8+tMhkamFXwkDEZxmgI/oE?=
 =?us-ascii?Q?+mXrmvF/W8reQBnpuKQMH0bTdcodToNFKh9rlcNLL72kUm8HguHZ3Vk37naM?=
 =?us-ascii?Q?Ax9mh+5pruHixNFAdOIajQBLRh768ygVVJNWzNogKL3KT0U5SaqoVS0frWAD?=
 =?us-ascii?Q?EoLY1vbULstpdj2xVrwMcXAJzZGqynQ3THIpC8D+iy854o/JzGjO5v+6jx7K?=
 =?us-ascii?Q?/Wh6QP2K6lILBpMm9NzJ7iXYYTDV+pRiZ7+/ZNVu8TTZo9xm/JVWuIizAkRT?=
 =?us-ascii?Q?J3mwvNWfXDXjiYHe0kTb28QCBU9vNihIZxT8IE/X1jERbti0hVvmoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a8ckxTjVPvaucD4d4Ytyed0BvSuMhsxYWJcF7k3oVbptk4IOgw52Eu5jocBi?=
 =?us-ascii?Q?gMMmSEEGDGbf4SVY+px+BJgWXBmOOg0G/mw2A7h+uGORSjEC/plNs9vg19EG?=
 =?us-ascii?Q?5y+kn7ag7abPWXHz9YOeixEgl2p8wD41y3W0vrg20STFJSIWjmDgOVqZ8u/B?=
 =?us-ascii?Q?laFt65T+pQmujGx/eAzP6UmrLCx3ILRyfN7xIWYIYvq8jz+8vS5+lGtXXVI9?=
 =?us-ascii?Q?27+FPTPH0zMmhJV6XHrVMiUevCEIiTlHb6ycA5JYMDYCPyM1jU7F3FOk/455?=
 =?us-ascii?Q?NDUMu9gzVd8dXlZJOEGVpbzeMQtETCwUzq4h7gCSj1v7limLRERZJ5/2q0/v?=
 =?us-ascii?Q?/2sDD9UjJFzufC4wHTGdot5nl3bH8oQ/bD8IOXcV6RQO3R1i050oy5v9/iRk?=
 =?us-ascii?Q?AA0NNMgmCnXtoZ2Krz5KK6PpHWTxa9eGGMukxQlkDMlzA1ulzx4J4XOo1BT8?=
 =?us-ascii?Q?hvKWjCvaOdLV6USVSChJz/BJGjc/ZpxkPMiIPr5w9ywYgsUtg+MeS1x51qVg?=
 =?us-ascii?Q?K7FSjtP5CK6VZmtXiJFDTElE9bCzw0nFLM3A//ul/889OuOPK7cnqyG5HkLN?=
 =?us-ascii?Q?OaRkXqb3tT0zlxVUmEpdkReWJEU6msCl6atRx/Rl4rxSSGrWQIVlMvj7uX1z?=
 =?us-ascii?Q?JXzUagn1tA9taFmkjOF5mASvX8XjHOnT26alkYvyfK2Yc42c9LSZhluOO2Id?=
 =?us-ascii?Q?JmOIx1m2W0PGIEWJwKkcsi1P8nyiUft/klD8Xr4sqIiwmcqwR7AfV9G1Y4lA?=
 =?us-ascii?Q?cL0Xm+H1fXkRDSNgfTEDyVG2bGaCivKdB2zuhWXfUIvqQ+bPye2vkrJPfg/0?=
 =?us-ascii?Q?upEOsTEumaSC1SRjLNCQgFLgiBx7kVv0M+fcDc+744j/gWMzllh0biRj1qE5?=
 =?us-ascii?Q?YCFePT2mPPOtOY45cOtePbxsGz2YN38PAT6vGJPGCXzPCfKQ5bikvI5zzge5?=
 =?us-ascii?Q?1yf+GcCmT383I617ICUp2vd60iqEMrAYjCWkAudfGPxXZFkprRfAxU12papH?=
 =?us-ascii?Q?hHc5MB54irjAuKS13x3S0WKhV6Cz+eYhlvyHQdUqf8g1TCSoh299nsXPhLQ/?=
 =?us-ascii?Q?MC4QdpOA4WjOwmK/sJjRtaquTkOf1dgs82Z83mixwgETSpvY68+EMqcdVkN8?=
 =?us-ascii?Q?+K6WL/hm8+tFX4z939vhYo1sGL5dSsvA5xs0WF/9k5ynmTOSFksW06e7S9oh?=
 =?us-ascii?Q?ADwfmw4rnzvX/ulO0fURFaC6mPmjx8K5X/GPkIJjXlx16wqIE6RlIg/ExwzH?=
 =?us-ascii?Q?rNWQl6lajsXv2mlRGr69xUWjcP2eBg/Y9o/Y/5SnQixm/2hjndERnXEFI6y4?=
 =?us-ascii?Q?0jrROdB9MiFzYAoxMsicDW0GmXLZRdNxDTzvOGLF3ixV+47W7UhZS+ZfB1Vq?=
 =?us-ascii?Q?wkpZZ/6vkjw33KGPMMESod3sWzXNrjxpdvyx2HIuoc7PJMt+klQMUmOSsrdK?=
 =?us-ascii?Q?PtCcJlpBiQSFTUQbGU8MdIt6kt5kXZX6aZkBI3Bpm92Y/B22skEaIzrUILH3?=
 =?us-ascii?Q?d1VFBtjuTTULm+sIfLfZks8Gliv6Bj8xdvCWb2XsQz9en4OWDv1H6sVm8zDy?=
 =?us-ascii?Q?t2k66u2AtLh9Ux1MneA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34859c9-96a9-4918-b1c9-08de0743f00d
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:55:50.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJ4e8sKsjA8wzy/WYA55fr2Gjo0XJRyMfr4Si2UEoDfnAUBrnRATgTvMKWj2J7JjTOME32w1cW1yZusOC6BFmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7383

On Thu, Oct 09, 2025 at 08:48:25AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>

Subject needn't double bindings.

dt-bindings: backlight: Add max25014 support

>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> In the current implementation the control registers for channel 1,
> control all channels. So only one led subnode with led-sources is
> supported right now. If at some point the driver functionality is
> expanded the bindings can be easily extended with it.

Need descript hardware, not driver. Need descript full functions even though
driver have not implement yet.

>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 109 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 114 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 0000000000000..496520e1374e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-supply:
> +    description: Regulator which controls the boost converter input rail.
> +
> +  pwms:
> +    maxItems: 1
> +
> +  maxim,iset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 15
> +    default: 11
> +    description:
> +      Value of the ISET register field. This controls the current scale of the
> +      outputs, a higher number means more current.

Can't use register value directly, need use standard unit. or percentage

100: means max, 0: min.

> +
> +patternProperties:
> +  "^led@[01]$":
> +    type: object
> +    description: Properties for a string of connected LEDs.
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      led-sources:
> +        allOf:
> +          - minItems: 1
> +            maxItems: 4
> +            items:
> +              minimum: 0
> +              maximum: 3
> +            default: [0, 1, 2, 3]
> +
> +      default-brightness:
> +        minimum: 0
> +        maximum: 100
> +        default: 50
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false

there are $ref, should use unevaluatedProperties: false

Frank
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@6f {
> +            compatible = "maxim,max25014";
> +            reg = <0x6f>;
> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +            power-supply = <&reg_backlight>;
> +            pwms = <&pwm1>;
> +            maxim,iset = <7>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            led@0 {
> +                reg = <0>;
> +                led-sources = <0 1 2 3>;
> +                default-brightness = <50>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 47fbc5e06808f..be5e2515900ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15171,6 +15171,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
>  F:	drivers/media/i2c/max2175*
>  F:	include/uapi/linux/max2175.h
>
> +MAX25014 BACKLIGHT DRIVER
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> +
>  MAX31335 RTC DRIVER
>  M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>  L:	linux-rtc@vger.kernel.org
>
> --
> 2.51.0
>
>

