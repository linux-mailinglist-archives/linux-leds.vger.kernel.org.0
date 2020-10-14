Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BC728DBA8
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 10:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbgJNIeW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 04:34:22 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:44365 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727692AbgJNIeW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 14 Oct 2020 04:34:22 -0400
Received: from cust-57f2be97 ([IPv6:fc0c:c196:c6c4:fdf1:aa47:ab6:e251:d2a8])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ScEnkixO3THgxScEokShRz; Wed, 14 Oct 2020 10:34:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602664463; bh=YnwRLJfOFl25PBiQ+NT70XXV3oo6tK3iz89VGKgdwQ0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nXyRmC4OhrlF2ue6bQuyVPHDw6WEJPGjeH+5xr23QcZAe6c/VJRVLCBs/+5UzgTGp
         v8PHD8me/VvPl1DTY+T6BeblZV8GrhbpWVKZJPCOyXs0Mza812BOJZHo9jFy5ZXwCE
         l1hHj8qAEYfreOaEVyIEl/p8u0YeHeWJXsX+pUGs2u2FWFIayHkDx2fxUNygxszn4+
         KSCNYxphAWOYyxOOUv5HQUDwOooZU0JCuzLhAl7QQxBa5FjHNho1BKCUMSc8wnrl25
         rG/t01Ld4yBEc9IulO1qgqoYkUksMYAlc8H7/R2e/6yqLFRHfz5KFqQOdFsheQRe9a
         seeZt5UAiKjdQ==
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Takashi Iwai <tiwai@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
 <s5hblh5mele.wl-tiwai@suse.de> <s5ha6wpmei5.wl-tiwai@suse.de>
 <20201014075853.GB29881@amd> <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
 <20201014081116.GC29881@amd> <2be6e184-97d4-a2b1-a500-6ea3528cff37@xs4all.nl>
 <20201014082752.GA31728@amd>
From:   Udo van den Heuvel <udovdh@xs4all.nl>
Autocrypt: addr=udovdh@xs4all.nl; prefer-encrypt=mutual; keydata=
 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
Organization: hierzo
Message-ID: <9cf705b9-1fca-2445-43de-916b13b9103f@xs4all.nl>
Date:   Wed, 14 Oct 2020 10:34:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201014082752.GA31728@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBHX51FODmJhTL+amlVs1/frV0a4wojAI56Nr4U1Lzjs1fwRT3kKVnEcMzGR6cdboZy+BPAKaUApE3q3M1fif4EzRQ384vWWULkJ2IvUTBSPpkGELmOG
 nW8FO3jMUSNAMaRxN1tWprgUksbAYJ8yHka81sWtaOJ3jJZ5vlQ7hpTBtjXXGg6WS8f3nsDdFLf6pY8n/Ao06XxT86TkZkJhca1b37on9oyBz/dXQM/IQYAU
 z/54EYNrbD9k8r0tZRlmWNLVk2+psRAsdA0bekqNHej/GGJtaSTEQKuuNqd6Ep/P8SYLJfNp/JSpho6AXEm5N7Y6SJqmZjZ8OydVknRrDOJOICdfjceN4lko
 pVlEVFMx5gLb4iU2DAn1AU3F/I4UjoqdqbqntLKiukI9UqC1/CZMkpXP+mecroVYJlZnfl2tMHMgU2l0l6IRLhLcwd7LKw==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 14-10-2020 10:27, Pavel Machek wrote:
>> One should have thought about stuff beforehand.
> 
> We did. And decided this is best solution.

Then the thought process went awry.

>> The non-selectability is not my fault.
> 
> It also does not affect you in any way.

It does.
/boot fills up even sooner thanks to this unused code.
Compiles last longer because of this unused code.

> Feel free to go to the mic LED discussion to see why we did it like
> this. Then you can come up with better solution for problem at hand.

I did not think of forcing code onto somebody. Someone else did.
This is effectively the effect of the LEDs thing.

So why should I `fix` this when a Kconfig thing is considered 'expensive'?
If reasonable arguments fall to the floor then where do you go?

This is the same as some useless things in Fedora that one cannot simply
 uninstall.


Udo
