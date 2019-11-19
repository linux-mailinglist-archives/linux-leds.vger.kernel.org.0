Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06F70102D08
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 20:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfKSTwd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 14:52:33 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:35765 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfKSTwd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 14:52:33 -0500
Received: from [192.168.1.155] ([77.2.113.117]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M4K6z-1iXQWt1RuD-000PFR; Tue, 19 Nov 2019 20:52:22 +0100
Subject: Re: [RFC PATCH 0/5] leds: Add DT node finding and parsing to core
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
 <ed000cda-3138-3172-1b4c-586b5bfd8d72@metux.net>
 <946f091e79242b9e71d5ce8ad12c899feefa22cd.camel@fi.rohmeurope.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <56d3a81e-f675-fd5e-06a7-8039bf02468e@metux.net>
Date:   Tue, 19 Nov 2019 20:52:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <946f091e79242b9e71d5ce8ad12c899feefa22cd.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ybOfltbWoYQWD7R/RRDMIGGQgKlqh+QYyD9taRCRk2O02V3kvZ
 E9/vN3sOo3wS6Skj661/hkW9dAiCEIETw/9xyTe2WBXw5ddK5ptZYcSvQ+2ck9SvihCQiNb
 2QHSTHgHviQRWbDlX8irzY62v654WcR9gbU99r3xh5weKZn0ItT2zwgfUMptJ/XfD9CXWkM
 qHCMga69n1pzM+KAvLT+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kItjpHsCPgU=:bxcWQZPnDigH4LcM8ooFMX
 p+bvmwIv7xirPI92van9kcwtDigaBNEdCIyeEBF5L8rQAdi34f9th9qn7WIgPHSeSpxf2r3rI
 l8X/P4qNGJk1JwJlJ+tVbzClV7vCbLZityQ6x//ukZmGUc2+PWr1RbuIVHioyIwOpUQ/bAAuv
 1Rvd1KZtMUTk+lHcSi/vXClPhZxw6bIkdtK0Lo6axv2BwV1+wWYbdKVquTN3pGcPhK362QFj/
 FD4xy+/1XaJall1kcUQ0EEqxB7ux28N6qeesbSSSo4Bqb1DLA/iWDP4weKKjhU7yHkN/yVMiV
 +16ln9oPpsRX7dcQoYTkeY25RD0TiUQUSycMcTuiR4DnbnV3qXRBtTKydCKJOC86H0QKFtUKP
 VjH+7YvboLHuGQ3GXMktcuCzBLXswLvtk0zNXT0S7L9AcfOqnh1nAimvHMtSVNsUVwtrgCHLM
 HROmb1Zii7oMyqEh9OGuUicJ2EACVK3GsfjN5HmKKvj9CyBIYFuHMAskyY4YAyn8gXquwx/j4
 DmM0y+Exa3ImM8jo7SZQCLlbeSpMRwMFGRl5bxi21XucXTFW8kppvcnMlWrCMbENU1PFZ4mEQ
 TFC87Jf+eYJXKDZ0oskmFkcFSNUCG364mDgQT1oraUP2z0FPzUOoddBc2ZCEpgaXZiPw7CSC6
 YpirCIRU3DaeFVeTg/8ui7Ax8DX5S0RAq/Uw4ohKLEOqTXjgmxkr3h8wwrjnzZpkadNsK8z8F
 lfFp2cMPhl/ONinbvPSBKeAMK6EAtVZFh0kIRsVem1xPoTTndkJQgYh8YuLSFEbAASgQqpGIA
 tMuiPDkXyJPGianirD0N1mpuiMAbLvumz/1rWDkm4Cxy1bxxWyu5PSnm4bbHVuNWax3aKkIuV
 nABSM7+IIQQgRQA2+WCQ==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 18.11.19 11:38, Vaittinen, Matti wrote:

Hi,

>> a) existing DT's (in the field) become incompatible with newer
>>    kernel versions
> 
> This was my main concern. This of course would not mean that we could
> not take this approach for new LED controller drivers - but that would
> (probably) lead to dual led registration interface 

Maybe just a flag for that ? Perhaps the driver could also specify a
list of node names for the LEDs, so led-core can do the lookup for them.

>> b) existing userlands that rely on speicific LED names become
>>    incomatible with newer kernel versions.
> 
> I didn't even think this far, but yes, I see... LED node name might be
> reflected in user-space LED name. I won't start arguing if this is sane
> or not - this is what we seem to be living with today :)

Especially in embedded world, this can really make sense: applications
just use a defined LED name, no matter which board it's running on.
Convention over configuration.

Personally, I also like to use LED subsystem as frontend for things like
gpio-driven relais, etc, and assign semantically fitting names instead
of "technical" ones,

> I didn't invest too much of time on this yet - but at first glimpse it
> seemed that at least some of the drivers did use reg - property with
> fixed value to do the matching. Those could set the property name to
> 'reg' and value to 'X' and leave the DT node lookup and common property
> parsing to the LED core. If my patch won't get too big objection (and
> if no fatal flaws are found from the idea) - then I might try and find
> the time to do some follow-up patches simplifying existing LED
> drivers...

Sounds good :)


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
