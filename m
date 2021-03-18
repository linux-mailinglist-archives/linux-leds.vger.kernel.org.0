Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDE3340E9C
	for <lists+linux-leds@lfdr.de>; Thu, 18 Mar 2021 20:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbhCRTwh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Mar 2021 15:52:37 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:32771 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhCRTwH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Mar 2021 15:52:07 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MgwBv-1lufP905V7-00hQZc; Thu, 18 Mar 2021 20:51:50 +0100
Subject: Re: [PATCH v2] leds: apu: extend support for PC Engines APU1 with
 newer firmware
To:     Andreas Eberlein <foodeas@aeberlein.de>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, post@lespocky.de
References: <20210216133028.4025-1-foodeas@aeberlein.de>
 <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
 <20210306165101.fnv6ytqofbolpf6s@falbala.internal.home.lespocky.de>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <798a0265-7f06-4894-7f84-64db6f236bcd@metux.net>
Date:   Thu, 18 Mar 2021 20:51:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210306165101.fnv6ytqofbolpf6s@falbala.internal.home.lespocky.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+bxIoX9ov4yiSVwImzHj09VyZcNPfr/TN9tv/1ZJyuvm1sVy44m
 LIxKaLhUnIidc2PMjXyP0/UY7ZVr29HjL5Y3Bn6k7SfQllsPDzPsQo27WU21mX6ltzy4LRV
 rLllmhBoPJxNoJ0sIQ3bXAFScaGQcp3JikNdaAM5ulNoyvD16QbXC9rsha3wCmN1BRXhnE8
 3ifS2d9r/PlHNcHFJi5Og==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZWcJYdXul5c=:Uz3yFNBC/c23mmVRznUkSy
 JHY7rslghyaUXjFaH0HmFezSUFOxLvNy5ACieLZyfsTx+3usCMYhcBiH7DgRkSWgdRj1j47B9
 OtCuF4dW2rHwIJSCTs+qVIU2kT0QkBNGDRJVUH1UPlElsDgtHzJjf+s5fy8Ccu0vBt5OVxhin
 Jcfp8BI3jcOqQEyNXc9yaI2MxpbMpEZgh3HYgUPDUCRik+WII8weuKiJbRSYuOeNnowntWhIl
 gOX3BzcWN7c0n3rm/OJ2qWbRlnRLhWaLOE3HGs5+no82xLk7WY2eOzcE9Bn9ZKGLnlxWl1mNY
 h/RtlzNP2BO6ssG3ijlphHRRVRYt28uLG4FraehgVouzZ3EadVPIFmKpgUi5dIG5DRBNh6Z3h
 lRgcZyeIVfPP+A+6qgAqZe9cEulx1PeFnblYkKx3mZHE8bT8YdtN9AifOQDlj
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 06.03.21 17:51, Alexander Dahl wrote:

Hi,

> If you give me a hint, which tree or patchset should be tested, and
> some hints what should be tested, I can try.

haven't written anything for apu1 yet (as I dont have one), but I wrote
the drivers for apu2/3/4.

My idea (which I never actually started on) was writing a separate gpio
driver (not LED) for the old Soc in apu1 and add instantiation w/ 
leds-gpio, keys, etc, into the pcengines-apu2 driver.

> Thanks for that work.  I have to admit someone from the fli4l linux
> router distribution team also wrote LED and button drivers for the APU
> boards, but never managed to upstream those. :-/
> 
> If someone is interested, those are spread in our Subversion
> repository, but the apu drivers are here:
> 
> https://repo.nettworks.org/svn/fli4l/branches/4.0/trunk/src/packages/src/src/fli4l/hwsupp/pcengines-apu/

hmm, maybe I could pick up pieces for the FCH functionality that's
not supported yet (eg. wdt) ... not sure how much they differ between
different SoC versions.

> Personally, I'd rather have mainline drivers for all that boards.
> Don't know if it still makes sense for the older wrap or alix boards,
> though.  I also have those lying around. ;-)

Well, somebody has to make his hands dirty, write those drivers, bring
them to mainline, and maintain them.


--mtx

-- 
-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
