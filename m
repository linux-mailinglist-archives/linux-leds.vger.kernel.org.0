Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64DAB196638
	for <lists+linux-leds@lfdr.de>; Sat, 28 Mar 2020 14:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgC1NBw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Mar 2020 09:01:52 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56243 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgC1NBw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 28 Mar 2020 09:01:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id z5so14508766wml.5
        for <linux-leds@vger.kernel.org>; Sat, 28 Mar 2020 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bkS7+mIYI0IrJgJxD3Z7awxNnug1s6gIGAdR6CXvFqU=;
        b=OZXSFS3VgwlTc8LQhdWveqQ1UElfKRBrXcmbD+AodCaeZwTWqGs8Fn6l1ExvIpwq0h
         Cv7Sxeqi0OPhZe0zrXimerGybOph1YNF/WYF21H3JLpo0I5+cjGwmj/i4GZvbXtmLEfn
         SAbGheFRZSgx44+ZSSxsW+hhf6Wsm+PMoInJOYln5InUyvTxSs4KuFdf4+f41/V9N3Ts
         LsXMsjzdim1/ylH1MFo9JeT+wefAuc2+Wl/ToWmlyy1U1qmXer0EVdl53HKfWv7SQlzb
         Y3F9aHHnTaWc1GIL1qblTLEDlT+Rlvav2oiMqF3PP4F/6FsyNCmRJoP2PPRkpjx4Ey7/
         s9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bkS7+mIYI0IrJgJxD3Z7awxNnug1s6gIGAdR6CXvFqU=;
        b=X3HxN6BgRxlinI9/g3YwPdHyIzfy2CleXWjLUzgv2LjMe/FkR7yRe67pNjC7Q5funJ
         w3jGC2LaUs8iWKa5l96Gmzf2PCW4C7LEtYGG40Ee+h3umg6kMw2eTpX6VtU9YijyeqYs
         7rNV3MYb2Mf+TG338AzTz748NqAG8DS6MDHyBcjNDqFykDNEXSiCp/0PIrz7wKtbG6FX
         Qi6bnR1/N5+BvbFOKyFB0LWi79lwI/It0j9Ze1ujz0Hzd4yoPuyE2iHbJGfCrPdfl3+N
         3ijtBrkbRo0krQd6SmrrmNtTZCSYpBBx9v1UdSpSsRgYs6GC0OafOVcaE/dHwciBEbV1
         aGBg==
X-Gm-Message-State: ANhLgQ0wGbnvkUJ4EZSOUJrXz02cJHY77cJp/CZPgViNQzKtDBq6alJK
        IlJJYg63mbtMYUDfD0RyqzAFDN2E
X-Google-Smtp-Source: ADFU+vvI0TYJfePSvSFYKL6jEow5Jg7jk/VIjVNOyWbm1ySMCsLsebAo7XSK+w/FX4JbnHyXoifPmA==
X-Received: by 2002:a7b:c08a:: with SMTP id r10mr3754440wmh.120.1585400509888;
        Sat, 28 Mar 2020 06:01:49 -0700 (PDT)
Received: from [192.168.1.23] (afgh70.neoplus.adsl.tpnet.pl. [95.49.163.70])
        by smtp.gmail.com with ESMTPSA id z19sm13446515wrg.28.2020.03.28.06.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2020 06:01:48 -0700 (PDT)
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321153325.GD8386@duo.ucw.cz>
 <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
 <20200328132729.5e628fe6@nic.cz> <20200328133629.79603fe3@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABzS1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT7Cwa8EEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheAAhkBFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl5O5twFCRIR
 arsAIQkQvWpQHLeLfCYWIQS/HfwKVo8F95V1cJC9alAct4t8JhIgEACtWz3zR5uxaU/GozHh
 iZfiyUTomQpGNvAtjjZE6UKO/cKusCcvOv0FZbfGDajcMIU8f3FUxJdybrY86KJ9a3tOddal
 KtB2of3/Ot/EIQjpQb28iLoY8AWnf9G4LQZtoXHiUcOAVPkKgCFnz1IENK3uvyCB9c9//KhE
 cRZkeAIE2sTmcI4k7/dNHpRI4nha/ZytPwTdM3BjAfxxQI5nMLptm1ksEBI7W1SDOnY3dG2J
 QWmqpxIefjgyiy0aU+jAw1x3RdZrokVD8OCJiJM8+Z36imarEzqIRQLh+sDNLfV3wEaBn/HU
 0Vj6VrRyW2K0jAYToRFD3Ay/eGSfOOAEr/LoMr3NBTDkRLEWdOozllOwADEY9wH0BLHMp2WI
 hXGOStNiroIEhW2/E0udFJo9b3VoOWKWl+zcUP/keLxVUCXhpmeS7VpSkqsrCVqTVkEc8AXq
 xhJXeIQJC/XRpCYFc3pFUlVCFViF1ZU2OzE8TndRzzD8e/9ETrJ1GAYa78tNopYhY6AbGlv4
 U01nIC93bK07O4IhtBAKsiUz3JPX/KA/dXJOC86qP373cVWVYPvZW+KOya9/7rz0MGR1az9G
 HqJB7q7DVcCQKt9Egae/goznnXbET6ivCNKbqkH3n/JpiPIxkaXVrbn3QlVtzYpROsS/pCOp
 5Evig7kql5L0aYJIZs4zBFsKioYWCSsGAQQB2kcPAQEHQFCKEG5pCgebryz66pTa9eAo+r8y
 TkMEEnG8UR5oWFt3wsIbBBgBCAAgFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAlsKioYCGwIA
 rwkQvWpQHLeLfCaNIAQZFggAHRYhBBTDHErITmX+em3wBGIQbFEb9KXbBQJbCoqGACEJEGIQ
 bFEb9KXbFiEEFMMcSshOZf56bfAEYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY0LLxM/rFY9Vz
 1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8GFiEEvx38ClaP
 BfeVdXCQvWpQHLeLfCbuOg/+PH6gY6Z1GiCzuYb/8f7D0NOcF8+md+R6KKiQZij/6G5Y7lXQ
 Bz21Opl4Vz/+39i5gmfBa9LRHH4ovR9Pd6H0FCjju4XjIOJkiJYs2HgCCm6nUxRJWzPgyMPS
 VbqCG2ctwaUiChUdbS+09bWb2MBNjIlI4b8wLWIOtxhyn25Vifm0p+QR5A2ym4bqJJ9LSre1
 qM8qdPWcnExPFU4PZFYQgZ9pX1Jyui73ZUP94L7/wg1GyJZL3ePeE4ogBXldE0g0Wq3ORqA9
 gA/yvrCSyNKOHTV9JMGnnPGN+wjBYMPMOuqDPC/zcK+stdFXc6UbUM1QNgDnaomvjuloflAx
 aYdblM26gFfypvpFb8czcPM+BP6X6vWk+Mw9+8vW3tyK9lSg+43OjIWlBGPpO9aLZsYYxAqv
 J5iSxcbbOLb5q8wWct6U7EZ1RnuOfVInoBttrlYvdWtcI/5NQTptkuB/DyRhrxBJc/fKzJ4w
 jS2ikcWe0FnxrQpcE2yqoUIFaZMdd/Cx9bRWAGZG087t5dUHJuMnVVcpHZFnHBKr8ag1eH/K
 tFdDFtyln5A/f9O22xsV0pyJni7e2z7lTBitrQFG69vnVGJlHbBE2dR4GddZqAlVOUbtEcE7
 /aMk4TrCtx0IyOzQiLA81aaJWhkD3fRO8cDlR4YQ3F0aqjYy8x1EnnhhohHOwU0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAHCwZMEGAEIACYCGwwWIQS/HfwKVo8F
 95V1cJC9alAct4t8JgUCXk7nGAUJEhFq9wAhCRC9alAct4t8JhYhBL8d/ApWjwX3lXVwkL1q
 UBy3i3wmVBwP/RNNux3dC513quZ0hFyU6ZDTxbiafprLN2PXhmLslxPktJgW/xO5xp16OXkW
 YgNI/TKxj3+oSu+MhEAhAFA2urFWHyqedfqdndQTzbv4yqNuyhGupzPBWNSqqJ2NwKJc9f2R
 wqYTXVYIO+6KLa32rpl7xvJISkx06s70lItFJjyOf6Hn1y5RBMwQN9hP2YxLhYNO3rmlNSVy
 7Z/r95lZTDnnUCuxBZxnjx/pMHJ8LZtKY0t7D0esA+zYGUrmoAGUpNWEBP+uSL+f8rhjSAL0
 HgoRL39ixg5Bm0MzJn9z3or++Pl5bRnSvHy6OKh7rzTjCwaGoZD+6LHBwPFPlmInX1H+yHrX
 lu1uPAdqG5xcsZAZFTxBRMEnYu1yYebDSA9x+iulggMZQcWC2GvHCaKIpKcFY8XCxk7Hbl5c
 8hcPKWOy16NLO6Y66Ws4kMedXuNUHe4zBLVlRbcYUdgT9Brw8nxmxu3KhEVsJkwOpXLUDuzo
 hQNfg9em95lpAK+VOTocke8PSESy3GbEtmoMueW3caSeDHb5dRP6WrndaYhEOzAA/KjuPU7J
 LMXOABOMIq+R38y7e2B3TnVDCrccdZDseFPUWmH0cGCGihH/j2UZG+PImrSDCh3h5MedVHGo
 sI62tmWm0q6lrljwSZmMZ30w1QaGmdFpI3Q6V+nZ7TZldI3x
Message-ID: <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
Date:   Sat, 28 Mar 2020 14:01:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200328133629.79603fe3@nic.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 3/28/20 1:36 PM, Marek Behun wrote:
>> This was only RFC, please do not merge.
> 
> Jacek, Pavel,
> 
> I decided to abandon the microcontroller driver path.
> But nonetheless there is still one thing I would like to solve.
> 
> The front button on Omnia is used to control the global brightness of
> the RGB LEDs, so that user can change it if the LEDs glow too much.
> The microcontroller does this as such: there is another PWM on top of
> all the LED PWMs, and this value can be manipulated via the same i2c
> interface as the LEDs, but via another command.
> 
> The thing is that I would like to somehow export this global brightness
> setting to userspace, because otherwise it gets reset after reboot, and
> I want the user to be able to set this global brightness by software,
> so that they won't have to change it after every reboot manually by
> pressing the front button.
> 
> I am wondering how to do this. Last year I proposed this by adding a
> sysfs attribute file to the device which is parent to the LEDs, but you
> did not agree :(

I already proposed adding a "luma" LED class device for similar
case [0], but didn't here any feedback from Pavel so far.

[0]
https://lore.kernel.org/linux-leds/1583502010-16210-1-git-send-email-nbelin@baylibre.com/T/#mf52c8d4f68260a445223c26957c61e6267e0932d

-- 
Best regards,
Jacek Anaszewski
