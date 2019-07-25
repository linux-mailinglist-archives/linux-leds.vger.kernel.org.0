Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D11758AF
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2019 22:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfGYUMO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Jul 2019 16:12:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46771 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfGYUMO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Jul 2019 16:12:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id z1so52030686wru.13
        for <linux-leds@vger.kernel.org>; Thu, 25 Jul 2019 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=emTk3+61iXlyZ6Kb+bar+5AtsaeYEER1baTGaWQ6chU=;
        b=UX0VCE9o+0xPz4SR49H9knekyiHDjtLhcZgcUwx+GrgLIrdm2xKvKxYK5Uc/7moXsz
         7Iw5d7Rgk/tF2xJ9o6BE5sO0lUuN6db4eUczLoqbJ2xW6YdK1+Fda01BTqwppyASR5C1
         MzNVZuFo9WGAdL7dMxdc4J5CUT5HFJUZGHE4U+UDQZ0JcEvS5NjNK9bFs9iuZiPhkKRE
         J10APB88b6A+4W9zxiLuO3xUVYLp+8Xd/rkwxSIVaozMXUYpX2tApSaZX7HerEhBXUhw
         L4dVLWgdtJd02ufOSCwf/km13eu6g7Curm214RCuL7U2U7CMNP1EZS7WrBF4q8JpzwxO
         JV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=emTk3+61iXlyZ6Kb+bar+5AtsaeYEER1baTGaWQ6chU=;
        b=ouhdw5OOFMUQDK1XZ9QhlcEVrbxWRfPusWcr+O9xlhvALQNf51fx/9i0ZOIyZCiPcp
         E1Z3WY2VDBI+rA84lQDnI8MYQffvCNha8R45GwW+rJpTuyGRkBhGv8tuuDn5iqLjUleI
         xl3I4dnJX8SnPvntQ5ChywKunP2FC9ugzhLkGrml5yZ4YiYCEUgKuBUaflbVd4CLC5tX
         CP+/jk+JH1ztQEY8M/9wc9aO0ZH8D6Mwu7k8uUcR0o/yO7s0NfFwRVFOOKZlbXaxqXXJ
         VlMxipuSJTJHTpsQVh706F7LNWDtoOcMoj7w6F9On5cmXkL+x//TAxZBOCZ0wHuoTagh
         8wjQ==
X-Gm-Message-State: APjAAAWq6YYKOMSFeFUCU3EW32aydWb9lrb+p7yZBCPkewXzml0FrxpM
        HMMfsXwz3C29toKtu3BWTjyh9AUq
X-Google-Smtp-Source: APXvYqwUOxRUYXT0IqDeFfLc413mEXonHxM5R4hg0dQeY+Q46DKkaUVMN5aC//PM5eiYUcHtyhp8Gw==
X-Received: by 2002:a5d:6182:: with SMTP id j2mr50285920wru.275.1564085531442;
        Thu, 25 Jul 2019 13:12:11 -0700 (PDT)
Received: from [192.168.1.19] (bdr31.neoplus.adsl.tpnet.pl. [83.28.3.31])
        by smtp.gmail.com with ESMTPSA id k124sm81063777wmk.47.2019.07.25.13.12.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 13:12:10 -0700 (PDT)
Subject: Re: Abstraction for dual LED driver override feature
To:     Philip Molloy <philip@philipmolloy.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <-SZHSFMkCZILLVhmVPIa2HVHWpZN2OId3iixPCrsBNWCmtyC2bt5ATy3iOTlNuD_12k6xRBcXwUf7_WT3Ij7ccp0357LdxUUSjojm2_LFUc=@philipmolloy.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 rbYkgqOjDRE9NTC6b68iUUVUayEADWz80qChbDJ2R2/Spm5+eojI2NVnr3AVSc7ZCBkhSDei
 TtSjQmlPflKEAR8LH67XbzvwvDwX/Lmi+/1Yxws0rxeJNYMqfOBBW/xi3QEc9hMDTl99EZwl
 NqfEN7HHh2jzAGNtIYxhHHiPUw/UZeS1fxD8vRqVZHW3ENR6lOCEYED1ChU1w8Zzm/CiT4ea
 ZakZChzFeUWVO/yFEcAzTJSiJHqLooNfP/VyFppjAlLVPISLcLBVTy+Ue76Z0IrC12fI38cm
 lJJGVY6NUbNb883pu5B7qB8huQINBFWjfaEBEADDzcpgTaAlnNd1Oqjs7V6yCgVbCxmV6v8j
 mkdp+4BWxQAg9E1O17h9lHJ8LzUfrkBcEq0amhHM19leoiMtgiE1yoOWL4Ndsp9PYE5mn7qC
 MiqFNel7wt2mUENgZ9yztrET9I/zbjA/RpTt+6RwlUaSNgz8RRN/UzJtTy2x5wxvPpWapfna
 TcFsPHQ2kYMl8di3ueNgnEwU+dlQnnlg7andjMDq+C4qGJXxnwKpsHMLnAXUxAVMZJUGjkd1
 WyUMep7SNqAzgZTRr451Q82XvokRHeZeNJfjo02olrwRl5L+jiPsMeUxT6fgTOgE1PulMxUU
 1Fm4/i6lQPyTKmB0KdOGOB+RrY2xwmvGm0bwcCChL6cE8lmZX1z7afIEZTZsWJ+oEJU8hGQF
 qHV8BOwhPisTZ6u2zx3i760p/GyzSuvNj6Exq9GNNG4LmC38rxMLg2HpNf4fWEl7R2gkdwhI
 +C1NQeetRtY+xVWnmG1/WygQKMvxsQFvCeTtZ5psOxZ5Eh7sDv0A3tAjqDtEGettAn/SAVmB
 1uJtjNsoeffNZVGojHDTNpD4LCRWJaBaNlxp+pVlPQa1oxKDQ4R2bRfsmjxLsI2aOsf9xNk7
 txOSY9FaVXBPVNWav36rg2O/ZdkSZ+RDaIDrOfj4tBo1aRGEFVn5tD0wsTTzszsxkeEAdwTR
 bwARAQABiQIlBBgBCAAPBQJVo32hAhsMBQkJZgGAAAoJEL1qUBy3i3wmahsQAJVgVlb41OsY
 +9BsHp4IqmGcJltYvIH0uEzYm0E/ykatM5AZxMICsF0W1aFt/KWFbhmucfyQ0DCQ6ywCdMKw
 jkt18W0hwljpf5NmQ/TmsVHl6ujfjphk8362Lz1L1ktR8tOKvQA9XSGjDa7mUJr50X5DpNlA
 53AyINNeuvzUx4mCNPR+ZqVhqR5/9mk+nZqVcLqDPf6x5RebOagAKPebWdEFtgbSHHhvf622
 JS+e8GkjDxePWsL8C0F+UYVqBfJj0uS7Aa11yoZosyLJ+NLS24tkbVo8w1oGWIrappqoo3gp
 w7yEjeKif5wizuA44khrOfcOR0fpdJ8Hjw4TggOEWGaktXtgpcdVUpA1xaS93oGm3CLKiuwm
 emtta/JV1aaOEZzJULJl2U50ceEmoxb1+z60YP9NgvNdXy34dq+TuYn/LCkOgSipR6broqKn
 4/8Pc9wdGkO9XuJ9czSQTtZHHc54pDywG6+4xoJAVF09ciYsKU30UK+ctlKNdiCbCsaIZzRV
 WLSvF/0ektHXij462VrwJJZYCD3B4zItlWvMsCk4/yYHKVDuSjfdOj3+8sGSEnuym3HP6pxN
 GIzz0qhTr6Hmbx3uhGQjFvfsWbGoqb5aqQckFVB51YNPSvWBb41AbAT3QvHn+mMIH0faOgJz
 5sZdKDFCF5AgguXPfX8yWP5PiQKtBBgBCAAgFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAlsK
 ioYCGwIAgQkQvWpQHLeLfCZ2IAQZFggAHRYhBBTDHErITmX+em3wBGIQbFEb9KXbBQJbCoqG
 AAoJEGIQbFEb9KXbxC4A/1Pst/4bM9GyIzECWNCy8TP6xWPVc9S+N/pUB14y9zD7AP9ZTZub
 GopbGO2hQVScQM02vGQBlgXVWhqOigr4pgwfBu46D/48fqBjpnUaILO5hv/x/sPQ05wXz6Z3
 5HooqJBmKP/obljuVdAHPbU6mXhXP/7f2LmCZ8Fr0tEcfii9H093ofQUKOO7heMg4mSIlizY
 eAIKbqdTFElbM+DIw9JVuoIbZy3BpSIKFR1tL7T1tZvYwE2MiUjhvzAtYg63GHKfblWJ+bSn
 5BHkDbKbhuokn0tKt7Wozyp09ZycTE8VTg9kVhCBn2lfUnK6LvdlQ/3gvv/CDUbIlkvd494T
 iiAFeV0TSDRarc5GoD2AD/K+sJLI0o4dNX0kwaec8Y37CMFgw8w66oM8L/Nwr6y10VdzpRtQ
 zVA2AOdqia+O6Wh+UDFph1uUzbqAV/Km+kVvxzNw8z4E/pfq9aT4zD37y9be3Ir2VKD7jc6M
 haUEY+k71otmxhjECq8nmJLFxts4tvmrzBZy3pTsRnVGe459UiegG22uVi91a1wj/k1BOm2S
 4H8PJGGvEElz98rMnjCNLaKRxZ7QWfGtClwTbKqhQgVpkx138LH1tFYAZkbTzu3l1Qcm4ydV
 VykdkWccEqvxqDV4f8q0V0MW3KWfkD9/07bbGxXSnImeLt7bPuVMGK2tAUbr2+dUYmUdsETZ
 1HgZ11moCVU5Ru0RwTv9oyThOsK3HQjI7NCIsDzVpolaGQPd9E7xwOVHhhDcXRqqNjLzHUSe
 eGGiEQ==
Message-ID: <af1df777-4a34-7c47-5b59-3b1c34a622bc@gmail.com>
Date:   Thu, 25 Jul 2019 22:12:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <-SZHSFMkCZILLVhmVPIa2HVHWpZN2OId3iixPCrsBNWCmtyC2bt5ATy3iOTlNuD_12k6xRBcXwUf7_WT3Ij7ccp0357LdxUUSjojm2_LFUc=@philipmolloy.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Phillip,

On 7/25/19 9:43 PM, Philip Molloy wrote:
> Hello,
> 
> I'm writing a driver for the TI LM3644 dual current flash LED driver[1] and could use some advice on how to abstract a feature of the device that allows the user to fix the brightness of the 2nd LED to the brightness of the 1st.
> 
> Bit 7 of the LED1 torch brightness register signifies whether the LED2 torch current should be set to the LED1 torch current. By default this override is enabled.
> 
> Is it worth exposing this feature to userspace? And what might a good way to do that be?

It depends if you want to control this LEDs separately all as one
logical flash LED? If the two LEDs are located next to each other on
the board then they can be treated as a single source of light and
logically coupled into one with use of led-sources DT property.

In this case the way how you will control the LED brightness in the
driver is an implementation detail and does not need to be exposed to
the userspace. The feature will allow for nice optimization then.

Please compare drivers/leds/leds-max77693.c flash LED class driver
which allows for coupling iouts.

See also the related DT bindings:

Documentation/devicetree/bindings/mfd/max77693.txt

On the other hand if you wish to expose two separate LED class devices,
then the feature would allow for configurable LED synchronization,
but I'm not sure if this would be much beneficial for only two LEDs.

We've had discussions about LED synchronization mechanism that would
allow for setting cross-LED patterns, but it needs more analysis.

> Or alternatively, hide the feature by setting bit 7 of the LED1 torch brightness register to 0 every time I write to the LED2 torch brightness register?
> 
> Unfortunately, I couldn't find an example of similar functionality in any of the mainline LED kernel modules.


-- 
Best regards,
Jacek Anaszewski
