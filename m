Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C146BE41
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 16:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfGQO3p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 10:29:45 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53911 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfGQO3p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 10:29:45 -0400
Received: from [192.168.1.110] ([77.7.13.186]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMX9b-1i3VR52amd-00JY40; Wed, 17 Jul 2019 16:29:40 +0200
Subject: Re: [PATCH 5/6] leds: apu: fix error on probing failure
To:     Pavel Machek <pavel@ucw.cz>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <1563202653-20994-6-git-send-email-info@metux.net>
 <20190716192805.GE10400@amd>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <7ec18de5-f71b-4b9a-0db9-3c010a8e67e7@metux.net>
Date:   Wed, 17 Jul 2019 16:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190716192805.GE10400@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0srtugDNayXYE+AWuw5JauOGcu8YeiV3n+ksdpHIlWS4f4wzwrN
 hLbR+a2Tb8SKjKKdqRB81BXU+uVVp3zX8m+sHFMKuQGOISC8OCoFw2pHImd/fb9NBV7kRwY
 VMJqzt++orNaz5mFxCRZm5h5DpXWCL+q9QFnJaGGXWeFLWhleXrGAu/KA2AaaiSps2kWZfX
 OJb+XpLVZp6HlsB1qpI7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u0lYIpEUqGU=:sGu5of7PSf1HM75QVu0Nyl
 TFeFAok/saS330hsIyz+LaNjjC1Cz862P9TUeidmq14LottEdK+1/80PzhhwJcABvivrFwOVZ
 kVHYrg4qTQ8tfw21vjT57in4l2ZX0PxhKkdz7QEsfOsiqRU2omcYruviaJMn2J4A2aIjLdLDb
 dwga4HklEeOcpGKwLYLel3nGRbLRK5tTWNWI71kFySBBIV8h+Tc9pPAyC/iDT1QOKCkZMgfCy
 SB7O5ZBNUPDNrjZq567+K30ri5TlAmHX5tvQD0aOJlC3zzWwGq07lm6XnSVAGJtdHKNqLixi0
 b21HR/mXz74VxjFgjNCGo5D14D4ER7Ww4dq+/U71yUxrIGT/sWJZZ2WNoIwbIXT5bjyG2sGoz
 JYfUTgt7eiO/zA6wD9JErkK5LKe3pr8MzxQVc3ikNCO5qYp6ez/OmDy/wGlWdXAZTRB/52rpK
 RMG6wVaNnRFWp/P+6O7hO+SV9l1zKNWTR/8xvzLLrRAHt59SXzILA7890l4937dY423fHZlQv
 avFPd4RJ/gZrZDHvpvSs5i0Rn8X6hWWyw16hM7Bq4sK2r8pGCNtfE8hsjtxM5rq11Xe2GXkA2
 tgmD2wfZyrut2Zqm4MK1ktBvD++mZjFvD1D/SGHgCeap4c3doH4wyeVmyP7Tj4SfzF0ML9Mig
 oWubHGTEt3qlATBwrJOLD954uMDDOCPPEVIPtbzaIi4HbQL2USGFn95idkN2aTmroX/caU4nF
 1leC7F2Hx6abrPDKsHaK2u8QC9Jq+ROKyeebm+KAktfweLW9n0Vv9gyk3JA=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 16.07.19 21:28, Pavel Machek wrote:

> You may want to add here: "For APUv2,3 support, enable CONFIG_xxx".
> 
> If you have any APUv2 users (and you may), this si chance to get their
> attention.

Good idea. Shall I repost a changed patch ? (or repost the whole queue)


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
