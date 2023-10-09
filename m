Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E917BE207
	for <lists+linux-leds@lfdr.de>; Mon,  9 Oct 2023 16:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376722AbjJIOCf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Oct 2023 10:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376693AbjJIOCe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Oct 2023 10:02:34 -0400
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFAF91;
        Mon,  9 Oct 2023 07:02:31 -0700 (PDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
        by mx1.sberdevices.ru (Postfix) with ESMTP id 7479210000E;
        Mon,  9 Oct 2023 17:02:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7479210000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
        s=mail; t=1696860146;
        bh=VIv1fPRfeUQ2ABXQND3Xssl9fUJMSRfRjC1kDBAbOvs=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
        b=adHfmjm4gyDN+jAMcYftcxb8ep5kfacXMJppxOqIFyibNJ+jmuH5Ce0S0DglNRaXi
         sWCVO45bOznJIFXQ2Q/ep6q+shNY17Fuvt7z2zeRQzZWADI5H4quDfGSMY6Ea5IaLE
         h9+ZMLvxV378hBDCE5T+wqhmgTubiVPelE3CBzNLOHkkZhd8U1geLpxHEHw1jABsIY
         GkDvAoq+3O5V3fWDuA/kAnsQLWO23T0+b42oRwaGtOCUmx8snFBXHurhNhddeUhuwU
         ra/E9oviTi1+Uw1uSpCLDkokncUURiRnS1RCA3UMVaqIs/4/CSX4ryRxZ2hHGkBwMW
         s2nbaliTjNDCA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.sberdevices.ru (Postfix) with ESMTPS;
        Mon,  9 Oct 2023 17:02:26 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 9 Oct
 2023 17:02:26 +0300
Date:   Mon, 9 Oct 2023 17:02:25 +0300
From:   Dmitry Rokosov <ddrokosov@salutedevices.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     <lee@kernel.org>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <kernel@sberdevices.ru>, <rockosov@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>,
        George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v1 09/11] leds: aw200xx: improve autodim calculation
 method
Message-ID: <20231009140225.gj7vkmmio5xfvtnk@CAB-WSD-L081021>
References: <20231006160437.15627-1-ddrokosov@salutedevices.com>
 <20231006160437.15627-10-ddrokosov@salutedevices.com>
 <CAHp75VcntHXe31H8C9GcGhc+HRA-gZjtD=uibMMYN-FS254RJw@mail.gmail.com>
 <20231009131808.lzri7z2nvcmkfuu3@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009131808.lzri7z2nvcmkfuu3@CAB-WSD-L081021>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180479 [Oct 09 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 536 536 1ae19c7800f69da91432b5e67ed4a00b9ade0d03, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/08 23:24:00 #22096719
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Oct 09, 2023 at 04:18:08PM +0300, Dmitry Rokosov wrote:
> On Fri, Oct 06, 2023 at 09:03:47PM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 6, 2023 at 7:05 PM Dmitry Rokosov
> > <ddrokosov@salutedevices.com> wrote:
> > >
> > > From: George Stark <gnstark@salutedevices.com>
> > >
> > > use DIV_ROUND_UP instead of coarse div
> > 
> > Please, respect English grammar and punctuation.
> > Refer to macros and functions as func() (note the parentheses).
> > 
> > ...
> > 
> > >  #define AW200XX_REG_DIM2FADE(x) ((x) + 1)
> > > +#define AW200XX_REG_FADE2DIM(fade) \
> > > +       DIV_ROUND_UP((fade) * AW200XX_DIM_MAX, AW200XX_FADE_MAX)
> > 
> > Have you checked if the overflow is _now_ possible (compiling on
> > 32-bit platforms as well)?
> 
> I suppose we shouldn't carry on about overflow here because the value of
> fade cannot exceed 255, and DIM_MAX is set at 63
> 
> You can find maximum values of fade and dim in the aw200xx driver
> header:
> 
> #define AW200XX_DIM_MAX                  (BIT(6) - 1)
> #define AW200XX_FADE_MAX                 (BIT(8) - 1)

I agree that checking if the fade is not greater than FADE_MAX will not
be excessive. The LED subsystem is capable of sending brightness levels
higher than 255

-- 
Thank you,
Dmitry
