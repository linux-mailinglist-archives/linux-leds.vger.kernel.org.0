Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E522E6D4A
	for <lists+linux-leds@lfdr.de>; Tue, 29 Dec 2020 03:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgL2CZu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Dec 2020 21:25:50 -0500
Received: from mail-mw2nam12on2054.outbound.protection.outlook.com ([40.107.244.54]:43361
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728006AbgL2CZt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 28 Dec 2020 21:25:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cByhOGRVlkbYPvTgeXkD5LGngtHZJAWnDv1pbImzv+ecksR/ZRtDl/ewXticN6jAooHhu9j7pXqOpvJHhjaVa9LLaJH2HejSPhkgf2wwi3FNqlMSw/fU6uPQ9YFnrAP0U8/N0KSqrk6jcTzs3PgqaddIG69m2lcaazyaC+Nqnz3aa+vgJfGQeJ39igvadvXwgYXa0lbmn9abAUaw2is4IEzRaaYjd8MxhgMi9DIm18jDXnamtOBylcE4p2UYMgBKcfp+QKVfGxsxCBEyxLDRX7LFYM0UURJzfOHvglsvfvgjGFDA0kgUmpyI2Ll+IkExD7QdMD1N8KnUici8eoSufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y0WnYN8pWLmzDNe4WKL2U8e6YfHjjqhTQTarMpLYYA=;
 b=ihvQvK8GIRzwkLfZFra9doTpT1TSLUI7f9O37GZOXfGyyiS5sWDnZN9tF8yppOSXfWJ9IzR1uqibEMFdIRmLgOfPahSLEQE4pfIR0ZXBUjYgXxZOME83pg9qKaCvRGgi+EZ5ivA0hJ5szA3kjI+8PRuGCbsxE8f0rt3PR/1QBXy6ZkHJk+4TVPjInfdoxCQYsKJMeVH9OEpNl7tCC6dR9pEbs5Y6twnvLQz+J8lXAL7ihFXpfEc8Qls1084WYjlM4rkTw1veT4O1SwSm0yI9rrX2qPY0R1UetcOZ/vKWwkI6iRogtXbjUAV8fRANzyWwZSFOI2imYK4q4KJq9Z/qxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y0WnYN8pWLmzDNe4WKL2U8e6YfHjjqhTQTarMpLYYA=;
 b=jE/SSp2PtZiVwOu7158L+j3ce5XYh4i1CsyS+u94B0p2BhHKOjq8cjdIM11TrfO8OiSUH/NkkOH/9xwcosVRyo3f4Xx5j8PjS4qyiCGMxdY/GhF+WauXmIVUrCFHNlEdPu4Ei4V2o2KDiBcq2C+PChyDLSkv1lX+tq1/EZz+Qs4=
Authentication-Results: lespocky.de; dkim=none (message not signed)
 header.d=none;lespocky.de; dmarc=none action=none header.from=synaptics.com;
Received: from BN8PR03MB4724.namprd03.prod.outlook.com (2603:10b6:408:96::21)
 by BN7PR03MB4417.namprd03.prod.outlook.com (2603:10b6:408:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.29; Tue, 29 Dec
 2020 02:24:59 +0000
Received: from BN8PR03MB4724.namprd03.prod.outlook.com
 ([fe80::e192:4c65:5936:1fb4]) by BN8PR03MB4724.namprd03.prod.outlook.com
 ([fe80::e192:4c65:5936:1fb4%5]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:24:59 +0000
Date:   Tue, 29 Dec 2020 10:24:45 +0800
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Rob Herring <robh+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v9 2/4] ARM: dts: berlin: Fix schema warnings for
 pwm-leds
Message-ID: <20201229102445.22c8587f@xhacker.debian>
In-Reply-To: <20201228163217.32520-3-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
        <20201228163217.32520-3-post@lespocky.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To BN8PR03MB4724.namprd03.prod.outlook.com
 (2603:10b6:408:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by SJ0PR13CA0104.namprd13.prod.outlook.com (2603:10b6:a03:2c5::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.14 via Frontend Transport; Tue, 29 Dec 2020 02:24:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b86a5b7e-83fe-461a-cf56-08d8aba0f086
X-MS-TrafficTypeDiagnostic: BN7PR03MB4417:
X-Microsoft-Antispam-PRVS: <BN7PR03MB44176193D9AC4C273174F94CEDD80@BN7PR03MB4417.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9iaqRYhaZ+bcf2kaquIPJO1VmRM4jBroJTTKvEDX4L0HwWP7ynFfIHXLh+Pu9qfPYqS7ACBK98Di1796rBbacEwOJCpKFUs6PgZ+BIF0FREk/l6RSGz++szQ/B5B1t+C3o1GLyrdAkmMuJlgHFDzDT+B96CNeqUQ0JZgVuEH1Vgp45dSiYYnVcIXloJ7jApkXfM5cVxfrgTyfwgRl0Hde/KAmn0WMe5Gf5TbacPitr4MkfAw8LvQXqqIZAJsj86YpiHvWEHJrc1z6pr5n0p0cokr97YnLh7yTfpOjSILsONU4+E5yEPzpipFSgSanbnRYsoU1yY8ldC6duVC+G7RWCF4R62WYuukNxL3tyL1Qbi8j803z4p7aWsaeBvZVqf0/XxMQ/641zUGcG6k14vKBdeM4su3h1le2mXj9IZGJkxkH7kY/R34DFFdVXvIBmn98tQ2m6n7+kktuIiGzr7nqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4724.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(366004)(376002)(396003)(55016002)(6506007)(83380400001)(86362001)(54906003)(16526019)(1076003)(966005)(316002)(4326008)(6916009)(956004)(2906002)(52116002)(7696005)(8676002)(478600001)(186003)(5660300002)(66476007)(7416002)(8936002)(6666004)(26005)(66946007)(66556008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QjLHKtag7H4tf/lYUXX9BZoH5e2Chah43BVTAd8Fd7NuYv40qME4xfbQ2MKV?=
 =?us-ascii?Q?Gi+odmzJaU0fpG2Mvpsmyk4rIH/hXMYMJ3bfH3/5jD/r8ce0t8YRNnrbZUPJ?=
 =?us-ascii?Q?FwMovwy66t7wauS3pTJyT5Nb/V0mxAUupEuFADkCPXRoyG6w+HGYNavCTRaN?=
 =?us-ascii?Q?XRBk1pIY7BfUOV1HjleGOZ/65GxTKaSRFGELS7z2kgMWAJspXNn0/2oUlIM4?=
 =?us-ascii?Q?sdw7zHfGomtDVbO/mnH4VdzManLIz47Z8OfKvvvAOgkHALOph4/1Te1GVQsp?=
 =?us-ascii?Q?2MbnXjmCDMnfRdLdKrWCAUxarNNNsEYlZdnGo0atWiUnB7RX/ywNU9R84Qgj?=
 =?us-ascii?Q?+Axs2cg9VOx3WUtp/khEKQNEiiqTU5BB0Syt5TRgiKHQxA9g29Mjo3A+zHml?=
 =?us-ascii?Q?80oYKXOe1jzLTt98V4pr0YmgIFMbbvMG6NswI2JWNhDZTn8BwoL5raRLsuWT?=
 =?us-ascii?Q?uVnm/XFkI55SXA6b0jcDyuVlqFdQ1lYD/hncFZ0bniHTEW2zEA1wvXIWVXeV?=
 =?us-ascii?Q?5mZeD9eu8Lz76w7yWIJsejwiyNLLN3vhfqq9no+7ZTl5iWUeMnPB3cYhAnAd?=
 =?us-ascii?Q?UuLZ+N88Aa98EoY4WbEfHS9iSqtMABPWenPhDmni2qxvASb8O3eRA1NV1kOr?=
 =?us-ascii?Q?cFtfzW19Iy+D90L/F/c5wqdqKXfUp0Da4Rvv1rw8g1/KIRodznrvL7P5iKab?=
 =?us-ascii?Q?Our7U+cei4roeEmoWHn+xMuRNloEAdO5dzUy+sALPk9pXKGojpzAS5TIdmWx?=
 =?us-ascii?Q?Upy5modeApWPeo39vc8pLfA/ODeSN+r8+iSuPLW0KHnRSRSzKeNfGa+vCTvO?=
 =?us-ascii?Q?ACib6ERK/pO3ob5Y8KjsZSX+rpAXBywKmUGagXxazChZFa7zzu6WRrRJWSh8?=
 =?us-ascii?Q?iEl+tc9YhuSzLUNUD0nuvZLdtF4b9KdPqT2MWSHRZrb1561W7EP5H1VEgBZc?=
 =?us-ascii?Q?2jDNnEkZaB4NSXY30iKu/uUnWNOUVxzn+XYzwJ59TJS4An/Bmdc8YVOQerWO?=
 =?us-ascii?Q?ESF8?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4724.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:24:58.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-Network-Message-Id: b86a5b7e-83fe-461a-cf56-08d8aba0f086
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKIMKD6XlDcgy0vdKJ2BKx1wYzZEw4K3cJV6lgdDihbPSoRINRLlsTg1F0cZUPL4HPjps13V19N+p1w4okiElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4417
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 28 Dec 2020 17:32:15 +0100
Alexander Dahl <post@lespocky.de> wrote:


> 
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
>   CHECK   arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>

Thanks for the patch.
I took this patch but sent out the PR late: https://www.spinics.net/lists/arm-kernel/msg862567.html
I will send out PR earlier for 5.12

> ---
> 
> Notes:
>     v8 -> v9:
>       * rebased on v5.11-rc1
> 
>     v7 -> v8:
>       * rebased on recent pavel/for-next (post v5.10-rc1)
> 
>     v6 -> v7:
>       * split up patch (one per sub arch)
>       * added actual warnings to commit message
> 
>  arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
> index 56fa951bc86f..c1d91424e658 100644
> --- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
> +++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
> @@ -34,19 +34,19 @@
>                 linux,usable-memory = <0x00000000 0x20000000>; /* 512 MB */
>         };
> 
> -       leds {
> +       led-controller {
>                 compatible = "pwm-leds";
>                 pinctrl-0 = <&ledpwm_pmux>;
>                 pinctrl-names = "default";
> 
> -               white {
> +               led-1 {
>                         label = "white";
>                         pwms = <&pwm 0 600000 0>;
>                         max-brightness = <255>;
>                         linux,default-trigger = "default-on";
>                 };
> 
> -               red {
> +               led-2 {
>                         label = "red";
>                         pwms = <&pwm 1 600000 0>;
>                         max-brightness = <255>;
> --
> 2.20.1
> 

