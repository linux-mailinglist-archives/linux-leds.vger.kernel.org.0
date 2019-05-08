Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 348D91786D
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 13:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbfEHLg4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 07:36:56 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54433 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727627AbfEHLg4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 07:36:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id b203so1675404wmb.4
        for <linux-leds@vger.kernel.org>; Wed, 08 May 2019 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1n5seRzjwFE2JAPpmlsAdvWESXCV7ha349PgP9YAChA=;
        b=EkvDCMSAAIpIhNQTKWiogMgrvUCaKx1SisounhivI7e6cgiHDQOTuOpMYOpAekljrs
         B8G2wIBZb83bRjCr4sMsepATJg2fM063cy/Ys8dXf0YkhF0CH/syRtdV6hsbwFq1neOX
         p0Y1blshiXio8oIbPDNaAqsiYcc33OMuPY8nbeCgKaXw34HqZolYc3f2uiMgF2U6r53m
         tV8EAFTwfpgw2iaglj/ZNjZ9GIFEc+WkE2qKWmjCjR/04RFgDq5kTJc9QNhpg2vgk6A7
         TXbGd0ERt4MJ8Yfv9cyRY6kUIO2pH8L22oK8KP7kfPfbsg/E7GnKHHjsvSEQyC6dQ2NK
         xuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1n5seRzjwFE2JAPpmlsAdvWESXCV7ha349PgP9YAChA=;
        b=V7e/n/QNmnc8QtI/JFDUiCZkBgf2WDY/BG8/YIxomuPFUXzVI6SS7mHMtcdoq6stsF
         RO7PDvje9/Jll8mUrN8ZS2/fm+jSzeYqVkNh5bZVWcYb6D4K6LepSCWyJ3KVo7EpyWJY
         OOm1fM6VEZLLit9osoVmpuAAo9DzNek6SKLCYUfU9pIYFOzl1nblzC664O0iBpXUKZui
         DgNv+3AArG1Jp+JJGcAjCO6aFWjNf3wzpbDOgvZ8uMAmJJe0WNo+DPB1bslfl/93TZmO
         GGIlv7TObKWTWULcODQQZ8wxQqoFgriiOcPuX49fuANTEewpCTSbZ/FC1J3ZgFYlPT1F
         fIAw==
X-Gm-Message-State: APjAAAUcQlHX/waX5x463CrZDAXZjZNnUEUcqTGeNY4kFC36FDQUwTqQ
        Y341BEn+9TxveA18tje+Lg8Ik+bF73I=
X-Google-Smtp-Source: APXvYqzdTuHQjmT/moThJdmQjilsHb4F5OpP8OfyK1Ch3EmrkCcjCc+533iIUmxF2dinFT5MliCHUA==
X-Received: by 2002:a05:600c:21d2:: with SMTP id x18mr2741998wmj.81.1557315415262;
        Wed, 08 May 2019 04:36:55 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id f6sm2784047wro.12.2019.05.08.04.36.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:36:54 -0700 (PDT)
Date:   Wed, 8 May 2019 12:36:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 5/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Message-ID: <20190508113653.GD31645@dell>
References: <20190506191614.25051-1-dmurphy@ti.com>
 <20190506191614.25051-6-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506191614.25051-6-dmurphy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 06 May 2019, Dan Murphy wrote:

> The LM3697 is a single function LED driver. The single function LED
> driver needs to reside in the LED directory as a dedicated LED driver
> and not as a MFD device.  The device does have common brightness and ramp
> features and those can be accomodated by a TI LMU framework.
> 
> The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicated
> LED dt binding needs to be added.  The new LM3697 LED dt binding will then
> reside in the Documentation/devicetree/bindings/leds directory and follow the
> current LED and general bindings guidelines.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v4 - Made assiciated ramp bindings changes and capitalization issue otherwise
> no change - https://lore.kernel.org/patchwork/patch/1068618/
> 
> v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058762/
> v2 - Made changes to reference ti,brightness-resolution to the ti-lmu.txt -
> https://lore.kernel.org/patchwork/patch/1054501/
> 
>  .../devicetree/bindings/leds/leds-lm3697.txt  | 73 +++++++++++++++++++

>  .../devicetree/bindings/mfd/ti-lmu.txt        | 27 +------

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
