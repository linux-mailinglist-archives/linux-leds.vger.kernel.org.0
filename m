Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 173B21634D6
	for <lists+linux-leds@lfdr.de>; Tue, 18 Feb 2020 22:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgBRV0l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Feb 2020 16:26:41 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38793 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRV0l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Feb 2020 16:26:41 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so4516226wmj.3;
        Tue, 18 Feb 2020 13:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7Dr3xT8cbgOGUG9hwbjrH/UB/nzUgjKcbKYahAf88Rk=;
        b=OtYwTxY3sNcm73PiIRfCykz0Fhif4DBY1+T4ZEjj30kGXgkKJF+9LsqJ4X4im/c8lK
         Sof2vlH36JTBSPiAiYJ7qEk2mxRxWCYP5jB7CACroQK3eaWQ3h+0cqsOZcYzH2aWBRcc
         ZP9xbjAAw5MEUcwDWF6KtBl4SsIipH/e7nQzgbwiYfPjCZJ4r3NXT1euhMsJe7ruY+wj
         cBFpCaZa2LApCwwpZLYPF+AUcg1CXZtqYsEHRm+fLwyI6bu28Fn14R6JC3IBWhIOg4W2
         tWmRyg5PRnAUW3AOo6XgnVrY7pF390ekpY+WHLXWwCPRq3Q92VIxIFEmjQMzOY2qd569
         aUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Dr3xT8cbgOGUG9hwbjrH/UB/nzUgjKcbKYahAf88Rk=;
        b=mJ16+nCWYmEmFIoGwo+eRk8RazCU67ElcgeR1wdwMdiZOW/sNz7BEYeknQxrVHtHCh
         IdFToVp5qiUKNaKzrIfrkPoNiAPltb09N9NV0xcyz457CR5DQlt1MQfCeoYPlG8WG0Kq
         BvvCzqIzDF+CuFe2QIlDmQxXDVS5EgL6sgSlYlb/2nEagaGe7TEmmR2vyGzEwcJR2sOF
         Z38Z9h3dEWwBTO2IDcPx27bQRbiuadkWHRYS0ABGnTynOpGwfiN/VBlidp6PXjBJPStU
         AtrEDN5oCZ1S4g364SgSN0GVO3ZcjlbBZMyTVxrRDW4SIFoDsmYK2sPxKEBcCoXF1Yao
         yU9g==
X-Gm-Message-State: APjAAAXxL+MDfibqwrnzlgevAs/4hSs3ucWMFOTjzrALqPyTeVSSoPC2
        kNao1tQvPY7cuWxD21QFejiOspad
X-Google-Smtp-Source: APXvYqwhE+iNX8bcZTcRnbHzcaDBmcx/fLZaY5WjrWWKwE80FjJxK5+o8E5l4GR0a1gtMETql+nM/w==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr5141063wml.159.1582061198338;
        Tue, 18 Feb 2020 13:26:38 -0800 (PST)
Received: from [192.168.1.23] (afcx122.neoplus.adsl.tpnet.pl. [95.49.75.122])
        by smtp.gmail.com with ESMTPSA id c74sm82964wmd.26.2020.02.18.13.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 13:26:37 -0800 (PST)
Subject: Re: [PATCH 0/3] leds: add support for apa102c leds
To:     Dan Murphy <dmurphy@ti.com>, Nicolas Belin <nbelin@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        pavel@ucw.cz
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
 <04642127-0e68-43b1-9b6c-0dbb56dc9bfe@ti.com>
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
 AQYVCAIJCgsDFgIBAh4BAheABQkJZgNMFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl05/9sC
 GQEAIQkQvWpQHLeLfCYWIQS/HfwKVo8F95V1cJC9alAct4t8JqsxD/0U39aol03a1/rGQ/RE
 XJLh+3SxPTjOQ4IV84zGzyZn4pmgxT5fdr58SmkMvvGBEWkfIZoR6XuVKLV6q3OypnkmIdsN
 LUe3UbxO0BNvyryJ3ryp5J5baZ/NotD3w08QsZ9RcWhSpRCQbnPan3ZSsYXgy6PW84hb3enC
 8Ti4Ok2yX6OuLAeiYu2MhShm0hGMZ9lELJRAjS+LktjNcJ5u7MCMYPsmHZgCnt8Mau/epOry
 xf4NQngf/4jw+Iv6NcqQR6mmoiGUEkmXhZyCCAy7dza6WNgO6pFiCG17fcFfII8Chx87b+w3
 7IlFRNW5EWU7FSTiyvP9bxJAPA4DC0pXtPN3IXX+M4YHFbBLXcSMxvi7dfA8zNw+URA10irP
 vo0WYn33FgS+CQCYWZGKjG4FNG/wWzVzWNDTRZYnm97OpjqVxx0Oug9qVdZ4XN8+MiEptXcs
 BhOWq/Qi3vkZb37RMGE+p1MzXkOsJVcHtR6ztScPkUG1bB7BOfCv5y7y17jj1UMzM3Yj5r1g
 onWzq5mbOHkee4qfq0B8bJCHwy6NI4yVms0etGwiwtc6N4ZVrzhCT/Bq0Rw6jJDt35hpWixT
 Q4JmXQaV29sanXPa7xx3Y38cnt0CAWFDt20ZeZ1em3ZYpC9O9BeEisJZVASs1hsNkMPZXRNm
 2U8Fpk/h+RQOS8f5LM4zBFsKioYWCSsGAQQB2kcPAQEHQFCKEG5pCgebryz66pTa9eAo+r8y
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
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAHCwWUEGAEIAA8FAlWjfaECGwwFCQlm
 AYAACgkQvWpQHLeLfCZqGxAAlWBWVvjU6xj70GwengiqYZwmW1i8gfS4TNibQT/KRq0zkBnE
 wgKwXRbVoW38pYVuGa5x/JDQMJDrLAJ0wrCOS3XxbSHCWOl/k2ZD9OaxUeXq6N+OmGTzfrYv
 PUvWS1Hy04q9AD1dIaMNruZQmvnRfkOk2UDncDIg0166/NTHiYI09H5mpWGpHn/2aT6dmpVw
 uoM9/rHlF5s5qAAo95tZ0QW2BtIceG9/rbYlL57waSMPF49awvwLQX5RhWoF8mPS5LsBrXXK
 hmizIsn40tLbi2RtWjzDWgZYitqmmqijeCnDvISN4qJ/nCLO4DjiSGs59w5HR+l0nwePDhOC
 A4RYZqS1e2Clx1VSkDXFpL3egabcIsqK7CZ6a21r8lXVpo4RnMlQsmXZTnRx4SajFvX7PrRg
 /02C811fLfh2r5O5if8sKQ6BKKlHpuuioqfj/w9z3B0aQ71e4n1zNJBO1kcdznikPLAbr7jG
 gkBUXT1yJiwpTfRQr5y2Uo12IJsKxohnNFVYtK8X/R6S0deKPjrZWvAkllgIPcHjMi2Va8yw
 KTj/JgcpUO5KN906Pf7ywZISe7Kbcc/qnE0YjPPSqFOvoeZvHe6EZCMW9+xZsaipvlqpByQV
 UHnVg09K9YFvjUBsBPdC8ef6YwgfR9o6AnPmxl0oMUIXkCCC5c99fzJY/k8=
Message-ID: <812dc835-7f97-00e5-1d75-c160e11f63fc@gmail.com>
Date:   Tue, 18 Feb 2020 22:26:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <04642127-0e68-43b1-9b6c-0dbb56dc9bfe@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On 2/18/20 1:43 PM, Dan Murphy wrote:
> Hellp
> 
> On 2/18/20 3:37 AM, Nicolas Belin wrote:
>> This patch series adds the driver and its related documentation
>> for the APA102C RGB Leds.
>>
>> Patch 1 adds the APA102C led manufacturer to the vendor-prefixes list.
>>
>> Patch 2 Documents the APA102C led driver.
>>
>> Patch 3 contains the actual driver code and modifications in the Kconfig
>> and the Makefile.
> 
> Is this something that can benefit from the Multicolor framework patches?
> 
> https://lore.kernel.org/patchwork/project/lkml/list/?series=427513
> 
> Can you RFC the APA102C driver on top of the Multicolor FW to see how it
> blends?

Just to let you know - I am currently playing with Samsung Galaxy S3,
which has mainline support, and also with a driver for its RGB LED:
leds-an30259a.c. I am adjusting that driver to LED multicolor class
and I will have certainly some more remarks (also to the variable naming
I proposed myself, which after few months feels awkward to me).

Generally speaking - we have to do everything to make the addition
of LED multicolor support to the driver way easier and more
straightforward since currently it is painful. I would go for
a separate compilation unit for multicolor specifc part of LED drivers.
But I will be able to tell more after few more days.

-- 
Best regards,
Jacek Anaszewski
