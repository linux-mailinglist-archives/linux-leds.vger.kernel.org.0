Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F79B100117
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 10:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfKRJWJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 04:22:09 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:42143 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRJWJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 04:22:09 -0500
Received: from [192.168.1.155] ([77.2.21.1]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MA7Ss-1ih3Le0u1C-00BaBS; Mon, 18 Nov 2019 10:22:00 +0100
Subject: Re: [RFC PATCH 0/5] leds: Add DT node finding and parsing to core
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <ed000cda-3138-3172-1b4c-586b5bfd8d72@metux.net>
Date:   Mon, 18 Nov 2019 10:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4denmKhNZWlkhU/6wZxpJ6tT4GPJm7SFEqAwphUjKJ4JwzSIJlT
 HH7hR7I1oNqe3Kuh6tBPs5tV66m86jUTpZKFHLHrS4BXAo1mI3q9RQJvMbdUEjT7kzFPyOR
 iT4WSCiX2wJ/uIRGfilYVKYB8Jj+mSVe5GmBQNgcTMn22HoIJea5t48F3lzUy4DjoGv7BoR
 8S61Ly8Kws3WmyoneRCAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4z9+rY3Md2A=:++y1JdnfZxcMCQZQ08DSMW
 YVe+7GI3l8e0AhK1IDEnizdgPeiPTpfNDkcnkkQFxG+olfpFXeWCLgFsOOIQFZYClsp63M4g4
 FnVWdmU+KFiQS7eDcRb0cthHxYrH0LEQO/jTcDNwXXr3mWnJKsJxst2l49AgWNAaTXjHrfQ6V
 rPEaMBu99h2CKtK0R/Oi8DODWZZCIGWi1Q5UteMA4GD1Tsw1RPkbdzYatXNO8kH6vwOLV0mnq
 9hPi7zWh1fOfium8PjU+Lbsg2W+4PEgDtl21XkCZsTw63sUx7qZXX9DJkxg55BqhXJHaOrosX
 Zvjl4O3syOngg3ujsskc8kj+tvMK3wDmYdtYlVmdL1V0YeoH/N5+J4eBit5W8SuRHms3Nacwy
 DAHBeM8aIodjjPETVXjgSdfxsM/VIwg5zgjnwOyDM3+5bLcCI3bSddKNCw4oIqsyJ9JasRGS8
 xCnmesGTjoAp5j5zTgO5rRmP3QUpUjtI3dfBFgW4FeJmw2LK2CxUQtBjOsBjwHd+LwDXsECPB
 /uKrwK0gwIFB7QqQJgCINIghhSbXwinwmUNMXbbdobW0o0dwMKMdpmr557e88crO3CkgHsIOd
 75527jQGgoKbnS7zNzxIYAlkAQUPYPWy3PUIUA9di3lmmmnyfq0k659D8e2Arfsz7K/H2inC0
 T2dvaw03JWqUhPKy/7+5GvY6VLb90DPeQj3m2ayn7bkwkFsJR+kd2lLCSmY0B9+qRbshgZH+q
 Jvl5X4icBwLSH43gtgRCCWhrH/sgyM9vicOB+PZJCDALE1HcfZLqqhyjhzTkhuS0F6K+nalSJ
 pis9bQLO+J/yb8PFunl16TTzJcsR877j0sw16pZuvGoXaNu1f/1b5Ljk5rLB05KwbGvqf1fFu
 xvGDspK9BypSQpSMtWuA==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,


> The thing is that
> this approach requires the LED controller binding to dictate allowed
> LED node names - which may or may not be doable. I need your help to
> evaluate this and suggest better options :)

even though I like the idea of convention-over-code, but if that's
changing allowed LED names that would risk breaking things, eg:

a) existing DT's (in the field) become incompatible with newer
   kernel versions
b) existing userlands that rely on speicific LED names become
   incomatible with newer kernel versions.



--mtx

-- 
Dringender Hinweis: aufgrund existenzieller Bedrohung durch "Emotet"
sollten Sie *niemals* MS-Office-Dokumente via E-Mail annehmen/öffenen,
selbst wenn diese von vermeintlich vertrauenswürdigen Absendern zu
stammen scheinen. Andernfalls droht Totalschaden.
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
