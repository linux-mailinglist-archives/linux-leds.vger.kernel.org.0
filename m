Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DD517865
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 13:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfEHLff (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 07:35:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39088 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbfEHLff (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 07:35:35 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so2808709wmk.4
        for <linux-leds@vger.kernel.org>; Wed, 08 May 2019 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hAMl/+DqKNLcQ9uIhpIg0nMuYp4Zd7mNyRn5drWdpI0=;
        b=ptEhLMvtKWiWv+dp59FqYZsQybRnwOnRQqtLk4CJKo7J3FNsfcfKJa9PuIZyQM3UMQ
         6vFu56gumTM0/5BQp1riuwRFWJTqXB6c/fxLN03veEV4K8gO3zeGJN6M1ZvcDOe7HgcH
         30dMBzCfldQYcEMUJ71HQOpiTeSKHYUvAeYqdcLH4eo1UGKj/pEhJWTLTFJT4Zv3Ui1s
         /zjTA/PeiK7dQiuHpcl8x/WWW1aGmBWAaHy5Jl6GDsk78oKbRgDONQEqYzg3/TAKhO0i
         a0hWu3TDQbb3tRZK1wAzNTJ5kb3Nxh9ceBdDn8KEBnZwpNiW2Oc06U6UKDqCo/yfGIPG
         ZhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hAMl/+DqKNLcQ9uIhpIg0nMuYp4Zd7mNyRn5drWdpI0=;
        b=LzkJt7DZkD83XSTOUA6wOh1N3IbuPvtFBEN2dqdovTC4FBD39pm3GBWDGre14SEvoQ
         203ZuQ3Dal0qq2Z6JE3USwTrFE7T7BXv4RCO9efIbJ6/RqGLF0GiXBnmUgWGYx4Pn0Vg
         RSdA+RlFbn2lX4DwEWn7mwDu0y/tx0JBKZkA6uFw0MQ7Pgui0oH1nZV2W6be8VmAlfI1
         Qj9PsyCsn2JPOWZs/sa9qzkGU7RRGYyUmFE04Ms2eZp9JjdgErcsCnylC6Sa7NhwqPHT
         kN0tgkH4lWReID4QP5I30aDKfKawFGVbBl8X5EpNTW5ZX/7mId/68WZQ0yVaB1RVPSWr
         mCYg==
X-Gm-Message-State: APjAAAW9XWyBhjdGbeAdUnGaswqyyn1qvuCcGTxNaeeLFkwu1UbH0NNl
        LUD3Vlp8wNKWQL9WJCOMM0HbMQ==
X-Google-Smtp-Source: APXvYqxHoBEM8HLpvRpwmchrMCOZfR7Ng9ZIg90jSpCNLWdHtkuM3mJuFjkDJNPP8tm3QMKL03HBQg==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr2799407wml.28.1557315333317;
        Wed, 08 May 2019 04:35:33 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id r64sm7768004wmr.0.2019.05.08.04.35.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:35:32 -0700 (PDT)
Date:   Wed, 8 May 2019 12:35:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: mfd: LMU: Add the ramp up/down
 property
Message-ID: <20190508113531.GB31645@dell>
References: <20190506191614.25051-1-dmurphy@ti.com>
 <20190506191614.25051-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506191614.25051-3-dmurphy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 06 May 2019, Dan Murphy wrote:

> Document the ramp-up and ramp-down property in the binding.
> Removing the "sec" from the property definition as seconds is
> implied.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
