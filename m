Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328542F712E
	for <lists+linux-leds@lfdr.de>; Fri, 15 Jan 2021 04:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730834AbhAODvv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Jan 2021 22:51:51 -0500
Received: from mail-bn7nam10on2044.outbound.protection.outlook.com ([40.107.92.44]:22881
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727116AbhAODvu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 14 Jan 2021 22:51:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSBm2/f5l5E7/08dIe8bF4pxI4b1BwmP1DJO+NfM3jSjtR2g6MLOdtbEEbwLl38H/SZaD8DLLVWfpHCZxoECPnJ6GMSwo6jKW7yeHL8YiX9LR43oW72N/OMRGC+ml3eQjN2KyiGfjEZwotvtMAXdq3o/8jrvoO8z6i0KenTPuLR9fsNIFluklt4oBgeaCFWiSRBcLTNhEQoazT0G3nC77UVPLjlaKZRPNCzeyEOm/CPwOOOBQ2p5yOBsgxM0gBImdpaZPU+c4H6aZYf4RFfBrEpMK8Wc6el8qKCzJZmG3StbDv9dRv9M2vOCjmqkk8GXps9++w/soIUVYOWbNhnIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP+OWISoctf3LsgM/ywx4HyZFHZdBYUpWIfjLCWuv9g=;
 b=nONO/RNnYXmIA53I3YB7XVhOT/J5bweb3ShnQIEtyF/PPImMTYTmMfU+gwl3INa8IMMdRK5KIdf4X3YDxu4DMXxlVHQxnTaIrZpidVYX0P58HQprrhQv7XyW46rUXkZLR3i/I46SMroduTZV4EyHheO+JeVY5M0+iCjfefYt54NXXZBNjVDaV+kYTqzAuvpaXC/NK2uzN4X+IQ+87pLJx5dm8uAwflM5g5cx36cUAlggFEWiLwYa2RjWbKXXPGqIM1zQvvt10KKgVjNCzBo+TIYAW2aK0sGNPYcQwJGa+ThTvyQY4Gu4t0zTH4aeHZW3YD/mQoFKmqxKvqm7lQNkKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP+OWISoctf3LsgM/ywx4HyZFHZdBYUpWIfjLCWuv9g=;
 b=JZMm2frla3aw8ZeF2PKVLbkH+g3YTaYx0zMgvPScSVPkAmVylEvfHWWzWCKvhD8hJF9pAl2bqnUud/o9fpCV7xPCJEE2MwjWKPehhpy3+RuICJqMDrGf3nPleehXLJYaeknlWUB3MmJX2Te7jlR51+ev5Hhljlx8uFuaSyoowfU=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Fri, 15 Jan
 2021 03:50:56 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.010; Fri, 15 Jan 2021
 03:50:56 +0000
Date:   Thu, 14 Jan 2021 21:50:50 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Alexander Dahl <post@lespocky.de>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20210115035050.GA27243@labundy.com>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20210114100312.GL3975472@dell>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114100312.GL3975472@dell>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:806:20::21) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SA9PR03CA0016.namprd03.prod.outlook.com (2603:10b6:806:20::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Fri, 15 Jan 2021 03:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1a831da-fe7c-41f0-cc0f-08d8b908c31f
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-Microsoft-Antispam-PRVS: <SN6PR08MB56317AE91CD8649D1F10B816D3A70@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVyIz+G7UrKBI6TenJROJmNzfpRqgs7DXtgfJQeDmEinlJMyQPNTvJKKOPWYaMvq0X488pztfHcSsxYKwgz2gxyYavtdQ6Hnle6d7gdvIvbqa6nIH6k3aLSf6lDKZbsGSK0/5TRA9E4on9tsIW0GJCVkUuG+AtV2Q5Pcbw16ciIy4J9r9ihfeMTUOlZ3Y1pWnYoy5njucQDu1NdslWGW1sQURRrlISgHtwEI+AE/cTOPnqRq3RmmISFaX5cqSmu/DI8sa2KmUS5iQ5mqmq54WNJJWqxb76Di6u6f8NJ2+S4iX0o666G58RanFGguQxo+OzkUsIsYXo5kGjUBh7UisUrW4VaDQmhXsXBcWRnIn1hyeviJhJFVj+6bWEhXHy/7kNeB7XIAVGmS88SWCFRQ2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(366004)(376002)(396003)(136003)(346002)(316002)(7696005)(86362001)(55016002)(7416002)(8936002)(36756003)(2616005)(16526019)(186003)(8886007)(1076003)(26005)(54906003)(956004)(8676002)(52116002)(478600001)(5660300002)(4326008)(66946007)(66476007)(66556008)(33656002)(83380400001)(6916009)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDJOUXVIbmhZRDZpY1ljUTA4c0NSZnZDSkZIVHVuVFF4Q3VQNkdTSUpZdkR5?=
 =?utf-8?B?SS8zRm5DQ3JKNUZFamNESnoxeVE1bnRLM2pVZnkwRUNBdlRsdUhQY0lDdVFj?=
 =?utf-8?B?OW5xTUVDNFZwS2R5RndCVElud3hZalQ0TjZiQk9KeXVTVEpKMVdiWEtrYmZC?=
 =?utf-8?B?Z3o2Vlg0NXZyS3V5ZHI1cU41bzU2NHB3Q2VQcXJiZEE0NGJsUVJ2dHo1bjY3?=
 =?utf-8?B?ejduem55Z1B0OEVmcDlybFZ0dDJxZC9sWXZocWxqd0lnL2o5ZU1ZZWtBMUFP?=
 =?utf-8?B?cjkrdU0rbmN5d05hQWRmaHVkNVBqeXROclEyQXFrUy85MGx0S2dhbHBGNHlv?=
 =?utf-8?B?U0FWemJpSW5aazkyQVUxb1hndEowSEkxa0dkQlhpRHUraUhQTGI3cmF2dnJY?=
 =?utf-8?B?bEdLVWJhK2FuUEZZVjY2Q2tWbzVCdWxYUUk0Z2hhOEMxcGlzeHk1YmY2eFBW?=
 =?utf-8?B?UnpnWmxTNlpFNk16RTFoM2RrSm5QNHI4QzE1TlFKU0pmb3BSL0N3QkpRejVM?=
 =?utf-8?B?QzF1NnRJak00bGpobmU2ckk0UEZ4Q2hteHY2MVNueUc2a3lOTEwrUEgwUHMz?=
 =?utf-8?B?WVhabXhoVmk0UnNQSGhveXpFWmJHVmxNTFAxbkk5NCtQcnFYVSs0Zm5JRDc2?=
 =?utf-8?B?dlRtS2RlK0daUXhNYkZDUzZUL1A0dlRIaGp6NThWbSt6UmRQWklkRHkrYWtS?=
 =?utf-8?B?eDVKb0lFVUhpVXgyclhodWFCcGRZQ3ZNN0dkZnN0aDJQUDB1MTFGVHg5Lzdo?=
 =?utf-8?B?eng0RmRtcEEvcGR5WVRzZmdWZWRXOWt1MFBLTUJCOTJ6OGlRejRIQk9vRXZi?=
 =?utf-8?B?N3hZbGduUHFzM0hBaDVkY1BtdFlteW52MGpMcUpoS1NFSVhnbktYL0M0UUd1?=
 =?utf-8?B?Q2xlYUp6ejNJWHdCWEQrZmhibERQYkI0V2w0K1ZVRllGS0J6S2tXNUtXTnAr?=
 =?utf-8?B?OXdYTjJXNkNYei9aVVVQbEtGckx0WUt5UXdGTHVWN2Q2WmxCQkVobmFicjlm?=
 =?utf-8?B?UEE2MUtkOFRoS0c3bVdqdmJUcFc3VG1pWkRCaENPODdDU3ZUTWxHekMxa0RP?=
 =?utf-8?B?Q0wvTXo5MGowNnI5MXNjSzg4Q0NnMmFYT2UwTmtoWm5DZkYwTXFDQzlFYjhX?=
 =?utf-8?B?ZnFhdEozUFBtdU9IYzhrVE9XNmg1Um9RMWdhZEUyQURWTkpVdUNmd2ZGYTZp?=
 =?utf-8?B?WlJtZ2dUVmtUWGpaRGM1dWkxWGl3ZkY1MlR5b1luV1I5eDdiNTViWndTRXJH?=
 =?utf-8?B?K0lsNmtiM1ZaTUVEamtBSFlDeGg4Ujl5cWRVU0p6SlNoTkhDcmFUdFAyN3FN?=
 =?utf-8?Q?BF0SOJS2IESMw9+UDo8fsCBMMplVpZKyqK?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a831da-fe7c-41f0-cc0f-08d8b908c31f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 03:50:56.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPQ+XkRa/WifLQHaIah9lOGP8SFFov18edVQEvPE73Sx81BgVU78tLKgnz871n5hNv5kRcHze/tPbDG5F8nfBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

On Thu, Jan 14, 2021 at 10:03:12AM +0000, Lee Jones wrote:
> On Mon, 28 Dec 2020, Alexander Dahl wrote:
> 
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).  Parent node name is not enforced, but recommended
> > by DT project.
> > 
> >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> >         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > Acked-by: Jeff LaBundy <jeff@labundy.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> > 
> > Notes:
> >     v8 -> v9:
> >       * added forgotten Acked-by (Jeff LaBundy)
> >       * rebased on v5.11-rc1
> >     
> >     v7 -> v8:
> >       * rebased on recent pavel/for-next (post v5.10-rc1)
> >       * added Acked-by (Rob Herring)
> >     
> >     v6 -> v7:
> >       * added warning message to commit message (Krzysztof Kozlowski)
> >     
> >     v6:
> >       * added this patch to series
> > 
> >  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Failed to apply:
> 
> Applying: dt-bindings: mfd: Fix schema warnings for pwm-leds
> Using index info to reconstruct a base tree...
> M	Documentation/devicetree/bindings/mfd/iqs62x.yaml
> /home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:34: indent with spaces.
>             led-1 {
> /home/lee/projects/linux/kernel/.git/worktrees/mfd/rebase-apply/patch:35: indent with spaces.
>                     label = "panel";
> warning: 2 lines add whitespace errors.
> Falling back to patching base and 3-way merge...
> Auto-merging Documentation/devicetree/bindings/mfd/iqs62x.yaml
> CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd/iqs62x.yaml
> Recorded preimage for 'Documentation/devicetree/bindings/mfd/iqs62x.yaml'

It looks like the following patch already beat this to the punch:

8237e8382498 ("dt-bindings: mfd: Correct the node name of the panel LED")

That patch does not retain the LED's label or rename the parent node to
led-controller, however. The label hardly matters for this example, but
perhaps we still want the parent node change to follow leds-pwm.yaml.

> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

Kind regards,
Jeff LaBundy
