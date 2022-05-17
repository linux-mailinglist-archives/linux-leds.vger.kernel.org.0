Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E783D52AAFE
	for <lists+linux-leds@lfdr.de>; Tue, 17 May 2022 20:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352263AbiEQSgp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 May 2022 14:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348110AbiEQSgm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 May 2022 14:36:42 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80100.outbound.protection.outlook.com [40.107.8.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656E427FC9;
        Tue, 17 May 2022 11:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4MIbkJB2Gl5bMH+Uzx4OVHNR7StlB9FytZA7QDDxkF3RRid7J9sSOHPwVZW00jIvR5tGAjqZDC+ZpEnZJxGUioN4QDy/tIrl3mQG+hT6TD/YThaP8C2uHG6iAFe/xHjPTsdbmRKPfA2S9nJnP2/0t3+Qbvb8yE0so0HANlguEPRuB1CMSdOOjv7P1/qKQL4ZwxpRNMQyZ2hW+nAprsV5YTZfvzEXFM299bBBfdkK8Wh3UDfgR3Dc1zebAWhA7dnpthM1MU300LimLqc6uQE7Vv4/6GpDCv8UOjIZY7zwP+JU/YljBqYD6OEoaoLli0OsBEbSp18XaaAvQaI+Zq8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhoWrHzKENCf//vg2q+sLFcEFKjHf4Fq7h6a/BbZ+aI=;
 b=D/8eODAXjauT0S3RWm7Nlgzf7evQoSQJ8gTn8FFNXehqv0JkBZqbz3LXUeL6phsWwMJazSoCm1qNz19Nl4QZaXQUD/ieNa0wRz42jGBIRxx6NrXBHRKjQ91MgxgmLCQXjCni/s6RNLd5Yoq2Emdq94e1Q/JAK6UO1uPzH1Tz22ZW7ZjBsf7ms4+eczFx2cZleiFpxXYvNjCQveYEkwy0rbYGU5FdrJAnDRmCYKd4JAqfvCbCjA4E/X2X+/mmTxFiPc0q3tf/9WD5u4WxenH7sUoZlfx62CQuZ652z7EehP7rQNbotgcVSPwf82ks23uXfT8H71EcdMMVw4ZKupKaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhoWrHzKENCf//vg2q+sLFcEFKjHf4Fq7h6a/BbZ+aI=;
 b=YXhczAcmWND0O564k7U7XoCsiKi7PCssxIJNE8Zf4NTwoqO50b025Bzk1g7cgK/OrsIra3CJIv99iSCvx8cRY+0I72LTaj7LEA0IDxVh5lX+gSKQVdt0AEm4oZDeDlGFRzasM/KTbM43mdZQuuCJvbWEuhZ5U8nqsRXp4/X8YUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM5P189MB0275.EURP189.PROD.OUTLOOK.COM (2603:10a6:206:1f::12)
 by HE1P18901MB0203.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Tue, 17 May
 2022 18:36:38 +0000
Received: from AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 ([fe80::f941:9cda:92c3:788e]) by AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 ([fe80::f941:9cda:92c3:788e%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 18:36:38 +0000
Date:   Tue, 17 May 2022 12:36:29 -0600
From:   Kyle Swenson <kyle.swenson@est.tech>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kyle.swenson@est.tech, pavel@ucw.cz, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: aw21024: Add support for Awinic's AW21024
Message-ID: <YoPrLbGBnSuYgEzF@p620>
References: <20220513190409.3682501-1-kyle.swenson@est.tech>
 <178182e1-edd1-9f27-6441-a0a9fabde567@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178182e1-edd1-9f27-6441-a0a9fabde567@linaro.org>
X-ClientProxiedBy: MW3PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:303:2a::21) To AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:206:1f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34d95f36-000c-4824-7cd9-08da38342d89
X-MS-TrafficTypeDiagnostic: HE1P18901MB0203:EE_
X-Microsoft-Antispam-PRVS: <HE1P18901MB0203EAEEB4BC629C39ACAD7DE4CE9@HE1P18901MB0203.EURP189.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wUeiScvBzCA7wkV7hQRBVNezg/B1YU7WUTNx7FmJpVDyTi+IxDHTmWoYhYOeLfAmtEaqg8shrxHxrG5FuiAEbJp8Q9gTZYzwcIy96vDr6PJgLS2iOkAyZM/vTkD5dPW4Jr0Fq8uhQEiWe0HHxEo7n6hkdO2x8Rt4zgS2FQ0v09kTTzJQqs2hdpE/06TVQjeTf1qyLAM4pzjSa2ThWMVz9jBR+g0Hx4TGMpDfX2HOM1zxrjyASbkqw9XfyI0llW2uysgmnvQdBt0QXKekhmmVTmZ7FWGck+kUXO6AkeFaFJMPjzN7KOiRndssgAqhKvm7HSsoK31XW1U0k/JPelnqZI7Ita4qGKv2G2vAg9Az/htaNA/5dw5r1PrWpv2nJbGraeIvzY4aGRfESEquYZCD4ApCGtCEce15IPmVJT5u3M0Xkj1KhTpGIDhAC/r9QDcxT/ExomWV1W6etzUMgR4zDTejn2Tgpxxz3s4i7zsLwvuYdKdogPwyHvx+ihHIAjJPVKeJt9jw5wWmhtRvo6VLFnyEklBnMCELYaHLkAfflCoJZSsdYVOWr4j44TeeRhC+o2+wnRNcVYrt8DJaGMyqTv3Or3Udz4Qnz9HYqYUt4jUI+VrJ+luJMfga0UPsRYnRqSUhmVVGLtdTh4vC37v0MkjvPqnctsoAvKgGm/RtGA1hn08nfX3yXNYpA+q5eblyKEZlmR5yjC23K6KVEb/8iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5P189MB0275.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(7916004)(39840400004)(136003)(376002)(396003)(366004)(346002)(44832011)(66556008)(8676002)(66476007)(66946007)(8936002)(5660300002)(508600001)(4326008)(6486002)(53546011)(26005)(6506007)(52116002)(9686003)(6512007)(86362001)(38100700002)(38350700002)(6666004)(2906002)(33716001)(186003)(41300700001)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h+y1m9rRQRqRl/nigAOdnfnl9dWxyZlQNuWOVf8NadVNkPhMrrVbvwrnqFrn?=
 =?us-ascii?Q?zGpFm1M1JK1hvOLT3J1xdHqHgE8/7twyZcORMNaOb0nQ/Litc6+0zdqPbFBa?=
 =?us-ascii?Q?mWHNgBqAl6RW7Cvxc7voK1aXiEBelbQoYEwBOI3WV0FjvAJF9RXP37473ui3?=
 =?us-ascii?Q?+gaKJFjA/XMcPrK2Gr+CqYEFVNCGo5gNYoSvOof3p+0MKcAfYwjlwIYKoYwK?=
 =?us-ascii?Q?jUa58uGsRrhZa5bQenTSv4qTihIgYc+RyMXS/kV8Vruclnn0FAivrdsW01qd?=
 =?us-ascii?Q?kWpuZvSn+Q1Smi8RdxCb2f9JVVbYhizR5LhrwJleDcZgq3wgM/eCCYbzkl11?=
 =?us-ascii?Q?LPOz69jXb/kxSSZqRoC0sRHXJmYUWkcRyuFMhZNDX4NURFCOlcEyvNpgCALw?=
 =?us-ascii?Q?JLxbXOc5Z47Fq90NuuYS1Zs9+X9rYscjnX1Pvk6vqYNNdky6LIlyi5zPOTwd?=
 =?us-ascii?Q?1NdZBCGVdhcMtuntoUpgiXsRXkrNKM3y33Fy9Nw+3GdWtDZ/Fm6tnBCvo13J?=
 =?us-ascii?Q?U1BFGxMMldQiXbpIFM2VdhEebHv/eVMT0uoCemM5kuNrHuHDPLAArdnvkHgV?=
 =?us-ascii?Q?ML2hpKNmvWLjy/duyP/yiIFwbpShJ6gU3M0o5m3PMreXnNJhN+bR7Z4HZzgD?=
 =?us-ascii?Q?Tv/oawMi0wocpa74ttSrHgeOYcyJx7R9ngYJfGLxUMb9IQV4N4rAzn0rkyWr?=
 =?us-ascii?Q?nlbgKSTf0X9k1hwMfInB7dWvUHYyf4C7Ytkf7L1QIZPQn9jW6hVD9csIaQ/S?=
 =?us-ascii?Q?cmP0I9Tk4Uz1+gIofFM043pVE7dENSSRLPrbBGbdmDGFvcPEQzmKcJduuPph?=
 =?us-ascii?Q?ewuWXHirs076bNKffDIJMmEjupBIRc0noCeEfopeVUteG8lIqq6PdGgJ4fd6?=
 =?us-ascii?Q?/ctQs/eri2VAwiAQy1xsFfP/pyp9vBUBOmoemTIVXSsZsrZmiCCqa/TDeONk?=
 =?us-ascii?Q?J1nWxb3JuFpxTfBX98VvZy5gq/Dw1xIvQONxzbFNfaxHUEoA4O+UwG4hyoW1?=
 =?us-ascii?Q?EJuIY49XTkefETmVcEi07ky5hOT8GDYXb4ct1X80WIwGvkMiZjqpO/5wWr0y?=
 =?us-ascii?Q?YzRvMLUxjU/n9SyfNmHQCpyU2JluulahEP7J8NC8UzTfS5Euu8JGfiu0+Ybr?=
 =?us-ascii?Q?0BkassWwuiPeJqtZD/RBn9Te1HGojiZC4hfxUDR9RFp73PLRQYE5mWIxvuAf?=
 =?us-ascii?Q?ajwNqSJLhba6eQjGuVdLvuRbg8zYMFf//vhM2Zup4x24UZvsXJzEhlce3RbC?=
 =?us-ascii?Q?GcjO+hliWRq46xHMXANTkX49x5HSdxv6XPCHizpRLOqXAHyo4jt2eIIhd/B9?=
 =?us-ascii?Q?kwUj8mE+MDE1vLDtYvRG8KRsmVBhgLniCe89jZ2qU6De5DGviszAJ2EONyDr?=
 =?us-ascii?Q?8ly7poy3UBkRq980JB4nZdjFzkDJkgEj8Z7xymzF32IMFbDK+bktZO8cNYHV?=
 =?us-ascii?Q?0drXpBu8U0pMwC9/6A3MFFPgu2E4eSG32TOtokAgktDVgL/I80mQRyyKtHwa?=
 =?us-ascii?Q?0DHW8ki7BQw3/FSvsX4U282Bn/zCcuVVkH4htLWNpioZ+KATymsvRqcrpCiN?=
 =?us-ascii?Q?7Tz6ITOhP7VMs+YWDR4aeQ4nTOPJuSQRIP9D7HBa0Sih+9S4QPuUMElUYylI?=
 =?us-ascii?Q?dsHVs/IOPuOL+00kpqnd2CYpjz6Gk8Y1HwbA18FjNPHDs+Y5Z6RpFL1QZJ1K?=
 =?us-ascii?Q?3YY86zIafpjrBve+NV7Czzlu5evdQussnp1gMPht9Kw2c4OFFQ0Fnxaa62uC?=
 =?us-ascii?Q?RtPub0QmMdxo89ajfN9v/sVx7rtVx7g=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d95f36-000c-4824-7cd9-08da38342d89
X-MS-Exchange-CrossTenant-AuthSource: AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 18:36:38.0880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3ArI/kdH18/tQSoKoxTVutVRnZ8vOBke7eQ/3Y31wgs+7M5SijOTwQ8Pudg0vpMByEA7g6Gri104fKazpY4eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P18901MB0203
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 17, 2022 at 11:11:37AM +0200, Krzysztof Kozlowski wrote:
> On 13/05/2022 21:04, Kyle Swenson wrote:
> > The Awinic AW21024 LED controller is a 24-channel RGB LED controller.
> > Each LED on the controller can be controlled individually or grouped
> > with other LEDs on the controller to form a multi-color LED.  Arbitrary
> > combinations of individual and grouped LED control should be possible.
> > 
> > Signed-off-by: Kyle Swenson <kyle.swenson@est.tech>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > +
> > +static const struct i2c_device_id aw21024_id[] = {
> > +	{ "aw21024", 0 }, /* 24 Channel */
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, aw21024_id);
> > +
> > +static const struct of_device_id of_aw21024_leds_match[] = {
> > +	{ .compatible = "awinic,aw21024", },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, of_aw21024_leds_match);
> > +
> > +static struct i2c_driver aw21024_driver = {
> > +	.driver		= {
> > +		.name	= "aw21024",
> > +		.of_match_table = of_match_ptr(of_aw21024_leds_match),
> 
> of_match_ptr causes this being unused. kbuild robot probably pointed
> this out... if not - of_match_ptr goes with maybe_unused. You need both
> or none, depending on intended usage.
> 
Ah, yes, the kbuild robot did point this out to me, and I had planned on
fixing by adding 'depends on OF' to the Kconfig.  Perhaps that isn't
correct or complete (or even relevant)?

I'll do some investigating and determine if I need to use of_match_ptr
or not and I'll fix it either by removing it or adding maybe_unused in
the next version.

> > +	},
> > +	.probe_new		= aw21024_probe,
> > +	.remove		= aw21024_remove,
> > +	.id_table = aw21024_id,
> 
> Why other places are indented but this not?
Sorry, it should be.  My editor was configured wrong and this now looks
bad.  There are a few other places in the driver that also now look bad
and I'll fix those before submitting v2.
> 
> 
> > +};
> > +module_i2c_driver(aw21024_driver);
> > +
> > +MODULE_AUTHOR("Kyle Swenson <kyle.swenson@est.tech>");
> > +MODULE_DESCRIPTION("Awinic AW21024 LED driver");
> > +MODULE_LICENSE("GPL");
> 
> 
> Best regards,
> Krzysztof

Thanks so much for taking a look at this, I really appreciate your time
and patience.

Thanks,
Kyle
