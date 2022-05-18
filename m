Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7DB52C57A
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 23:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243113AbiERVSb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 17:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242511AbiERVSa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 17:18:30 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10113.outbound.protection.outlook.com [40.107.1.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50448227812;
        Wed, 18 May 2022 14:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JInEzv6tIs6LKoUHV0/bb6tpdW5vpErDMQhWc3x779S+S720gywGu2waRwceyD2G+bx4kML/A/nXhvaqUasiB+eJl/Y19g9ZFpZdlt0UomoTaueF+ZH5AACHlvvGgHQs+fRtqaBhKXTPGBJ33o62OFYDhtnTOeTW8i8kXuITBIR+9MYSoNODIbUU0WePZ/CoJO44t898wQRQByMCgcg+5jbUFTBdmYcvp0raLii6zTN93ftQ+qPcU51CBhzQEO1aHBt7l6vA46rt4s7JJ0tbNZiwdt6VQFx+nsVvmv01a18zJ44EexSZmrX+EqUlJM4RfJzCXUxdDXGbUBrTNYWLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3ota8r7K6A4fHMx+6ycK5l/hsQlHgM+sMeCF9FXunw=;
 b=mhnCEkNsWi1oI7UCAtyXiFfZsQgZfDYZNas0xn5fCwzwFhU8xav+nieaWFKLFY4voAOUsalUYRBpveqDfZuvV0cQcGWVJ+sbJviESpOC9yFDQLZL7VywjGRx8QFQJOWNLXveqy12F6qlpgM3cdVjZHVxemwuyqYzPPaEsh0OOh2mIciJFA9mBvvwf7ceRtF3w5srEL9887bobksdqTPGzCTuOF75IQEnDcLPxAUqLMXVHSgfrneBNxodpvuYXgC3cJwgYGYLumbeF7rSPp7ej/DvL5Uy9focs9jT+0gVxl/rUIedFUkaA4z2+a5ahABuOwp3wU0B5HbRZQz9pEpgZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3ota8r7K6A4fHMx+6ycK5l/hsQlHgM+sMeCF9FXunw=;
 b=WG2M5qpVmaJC46gf513BordVibO5zdgnk0ga2mR7yAtivpCtKSxxyO62FD2SBug0p2RXsYQftykwVu5ClCpc/eLGTiaKC2qXnSxZRVCR+gkjzhXNmifSPC6Jp+XgSR/E+nuqwdVCKX193Y1F4rFoxJst/s21FSijViIX9Wtd7Ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM5P189MB0275.EURP189.PROD.OUTLOOK.COM (2603:10a6:206:1f::12)
 by AM7P189MB1091.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:176::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 21:18:25 +0000
Received: from AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 ([fe80::f941:9cda:92c3:788e]) by AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 ([fe80::f941:9cda:92c3:788e%7]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 21:18:25 +0000
Date:   Wed, 18 May 2022 15:18:16 -0600
From:   Kyle Swenson <kyle.swenson@est.tech>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     pavel@ucw.cz, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add aw21024 binding
Message-ID: <YoVimFUOy581rJ9W@p620>
References: <20220513190409.3682501-1-kyle.swenson@est.tech>
 <20220513190409.3682501-2-kyle.swenson@est.tech>
 <cb83fbab-7aa3-d1a7-ab80-d2b94a516f6d@linaro.org>
 <YoPqDLMe+WYWKBxi@p620>
 <2c9b80ef-74c6-bd60-cfc9-d69349cdf6b1@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c9b80ef-74c6-bd60-cfc9-d69349cdf6b1@linaro.org>
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:206:1f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cb4ac59-62d2-4fea-a214-08da3913f1e1
X-MS-TrafficTypeDiagnostic: AM7P189MB1091:EE_
X-Microsoft-Antispam-PRVS: <AM7P189MB10914FFEFA22591C036CEE6CE4D19@AM7P189MB1091.EURP189.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5RKS9j6/hbqO+ePRp9ZYC4XZr82zRQpT9WJJrGBzgcVUaSoShawTt8/Oc9ExvGAzSKIghDyivUVN3XbSpCUANAq3HO1ZoSpCGrAhI9omzEXpjibmgmrmmVQxB92y0WwQ1/pyMPq6M2otkAaZHea9fgQSArKDuiJwaeAwxt36FIAfQSsdGRLSg4b+InMsOSUvxVlh8sgbXXIO789q+P73ZjaOFWSQS963dKfaxGEqGWDXrxnBBECKMS5kdmZY2H9A1okY1YwvDthltdHQnMNBtT82h2L3XB7ptcfYSWRnGyxz1Pt4I3NhokTthutpdYVSKe832gY8F6cxRQ12RZb/wQOVK0gu2GNtVvxOrUT7vaXCvAPtsDYi+VMq5AjU26TsoUMjkFxM3jf666Uy7R8qClCbOr0CqQCpTgdb4gAuw1atFkTSRUJLjp3w11wPmOlEKCB09NyJrAs6JVMLMNvC4QsrQOWBucq+QyeTgaY/RxCs1zT34guKWkZOnwyTg463YhOkw5z5jkBCmq7xrHo8HTjo13+cI0d8CkeE1vQop6KsaIQ4TB1Jc+hWthTyBT5g+zvUDBC+u5BoLlN/CXmbUqU0wZhb4fTT5LSqJopTzobgSCmA71VfAC/QTXf1P2bzmQZEn3YnNDaH++rey/cVuD8P/XUAef1LzWy8CupotZZCoD5SX1Y4Yd9/0uvO4QJxdeH1sQuinouFEo8tcvHOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5P189MB0275.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(7916004)(39840400004)(376002)(396003)(136003)(366004)(346002)(5660300002)(186003)(4326008)(26005)(44832011)(53546011)(6512007)(6506007)(8676002)(41300700001)(66476007)(66946007)(66556008)(33716001)(9686003)(6666004)(8936002)(38100700002)(52116002)(6916009)(316002)(38350700002)(86362001)(2906002)(6486002)(508600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EcfnZbG9TjPSyFBKM7zXKUoSWS2/S38vWjUx7uCmeg9+XEKfngRqQVzYMp51?=
 =?us-ascii?Q?7NvYFcZgHXaQaSEUPofG+scjmW1uE4xCD1iISL1NYPNpIslhDiHHqi/zQ7El?=
 =?us-ascii?Q?VRpayhLo/s/gSBoczQn91GbsO0TYKDrlG3JqqaA6yzGemyNm3sBV2OpuE1qG?=
 =?us-ascii?Q?7GC85daIbSP3zhVXslD0BhpyskdsIgYdto2JlmG0orLHmx3NUY7USZiAO+IB?=
 =?us-ascii?Q?rKZfnhbgkLpUyk0ZbFXS7GojdCXrS0sRK+KjAyXSRIgeCY6WcUpG7oDzGfgA?=
 =?us-ascii?Q?JUvgtHntf6MlYbpZWa2CvJYW4m6kNmrtexzatrpEDbsuwM2xVDdnaH0/fJHB?=
 =?us-ascii?Q?MGRJ1offDdDopfBafgCK1TIGynh0QrfWQo91LnfzgCh/quJSzWT23y5XgVI5?=
 =?us-ascii?Q?m4t4Wb15qcgWLelKgTBxxqda+sThPZ37uJOr7JIWHy9C3Ry22KG4t47naIQ1?=
 =?us-ascii?Q?7GPW5FITBF/B++UCGLkpt8YFFHZEvXslAiQ64ncTD0UTxGCSXfR41/bwXz7C?=
 =?us-ascii?Q?E5kRiJgohMb+uhp4G3/LVefDo+yZ9YRupcL/5uWY3+VVfHjlw7NzysyTQWwn?=
 =?us-ascii?Q?HKYMSBOU2eI896zEyiztN8hLkjylBCgDadoK1jp90y/4v5VP22OiPOwJeF5o?=
 =?us-ascii?Q?SLaybG9d1gwDIMfjBeeUGgCjo89WMX7HU+QEq9Rz1vf9Uwg1Ka+NwGNaPEtZ?=
 =?us-ascii?Q?0eEHDw84dHfpir2wzDYG3i//SFMtqFTdGy7KV9CJwzEsHfWl1fNzkXnD4zQL?=
 =?us-ascii?Q?UwqSNlaVbQIExxULHhy/+NUeEfKilcAxbwWLLQtIavgefCAaed9cfNg+oRap?=
 =?us-ascii?Q?Ys0oJmUl5OkE0gMlyH7ciLeVkG8octpiT6d5qoeM4OMn3ifkmWKUA0qQMQbQ?=
 =?us-ascii?Q?UP8NvPrTrkHkyRn8wYIIgaIxYhce4hFztoaQYWiRLQnHxohsnE7vZC51fbYp?=
 =?us-ascii?Q?1ecvI0Qq5z6onvQsWJzRcCEv+IL7nTQcpKOl1J4AAJjZyUFUj9zW4tYhkBxD?=
 =?us-ascii?Q?mnGBKB1hwrBsOJlEPpjGbr8ZAXb4+HBJMs3TihEJHz7SZWC8FX7uuaRj5ihs?=
 =?us-ascii?Q?Pizs1cDd8aVL1F7TuB5T5roChMcZ3Jzx7goLdljVb8OOx2qKu+phRZuRoidv?=
 =?us-ascii?Q?jwsOEYpdVcjVSWPkM89Scoy7h9oNqspg6bFe5aetsWy+nRR2fDJImcIOaaur?=
 =?us-ascii?Q?Zy05TUsi2DxioRGJe5qDS1FqqP+0s1Go81metmOT8jMHBeGQnJGgE/UfCyUp?=
 =?us-ascii?Q?M/8tx0W2TbsCMobulUdBpB8XBarTXYeJBPhjk7+e6udNfgSyKkosl8Mcnzm6?=
 =?us-ascii?Q?8VVsIvD4k3/g/0Az41k9vkMWecmd1An27E6HgFejpjXODSNtmgBwxKCRZm5t?=
 =?us-ascii?Q?/VplMoYjXttKCYUv8IPqrw9NyZgV+DuSS5UF3o65Eu8tQX/HHsUonxNpPqnK?=
 =?us-ascii?Q?+y6STg7vois4r3Nls+55LHi6FeBVmPjkOW/VzGJFle0puLqvPgjfiG8IIkbV?=
 =?us-ascii?Q?xWFjRzdTCCJ1BtgDRaazpnVQ4CS3UJHLkaXXAIdeab5vi/ywQJ7NTgZcaU/s?=
 =?us-ascii?Q?jPtRc4kHeErNvMOWtf6bgyC8iZqEiXQwR+LI/aqKtroriRvsw8kwttt9H/9X?=
 =?us-ascii?Q?AufYHdVs6SovW+caX0kljEFZKjMfI9wIxLOMlzI3JIqjwvhxSuZw4Ej781U+?=
 =?us-ascii?Q?HpTMHhH2YP2Gs7WJ0XQzl9hK8lcEaMBTyO4eMDSHYWwY2LGLQgUor49QD6N7?=
 =?us-ascii?Q?Jtug1A0bxg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb4ac59-62d2-4fea-a214-08da3913f1e1
X-MS-Exchange-CrossTenant-AuthSource: AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 21:18:25.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWaJqHaEYTVzv1/y7FUIk5DdGAsIj6pwyf+YTSUDtoN9Dp+NF9xHcEco6O/NJl/ECgkW8rKoAOm0kUN+xyANbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1091
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, May 18, 2022 at 10:17:21AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2022 20:31, Kyle Swenson wrote:
> >>> +
> >>> +            multi-led@1 {
> >>> +                #address-cells = <1>;
> >>> +                #size-cells = <2>;
> >>> +                reg = <0x0 0x1 0x2>;
> >>
> >> This is confusing. Does not match unit address and address/size cells.
> >> Perhaps you wanted three separate regs?
> > The wrong address and size cells and not matching the unit address is a
> > mistake on my part, and the next version will actually pass make
> > dt_binding_check.
> > 
> > That said, it's not clear to me how best to handle a combination of
> > multi-leds and individual LEDs on a particular board. For example, a
> > particular board with this driver might have the first six outputs
> > connected to two RGB LEDs, and then the remainder of the outputs
> > connected to individual LEDs.
> > 
> > My (poor) attempt at handling this resulted in this approach where I
> > (ab)used the 'reg' property to be able to address each individual LED of
> > a multi-led.  I'm sure this problem has been solved before, but I'm
> > struggling finding a driver in the tree that has solved it.
> > 
> > Any advice or pointers will be welcome, and in the mean time I'll plan
> > on fixing the (now obvious) issues with the binding.  At the very least,
> > cleaning up the binding will make the problem I'm trying to solve more
> > clear.
> 
> The immediate solution to the DTS reg issue is to use the same unit
> address, so:
> 
> multi-led@0 {
> 	reg = <0x0>, <0x1>, <0x2>;
> }
> 
> However your case is partially (or entirely) covered by multicolor LEDs.
> You should add allOf:$ref with reference to leds-class-multicolor.yaml.
> I see exactly your pattern being used there - just the fixed one, I
> think. I'll send a patch for it and put you on Cc.

I suspect you're right: mutlicolor LEDs will do exactly what I need and
the patch you cc'd me on teaches me how to specify it in the DTS.  I'll
make the changes and send up a v2 in a few days.

> 
> Best regards,
> Krzysztof

Thanks again for your time and guidance.  I happen to have a board with that
lp50xx LED controller and I'll be happy to test out the example DTS from the
binding if you'd like.

Thanks,
Kyle
