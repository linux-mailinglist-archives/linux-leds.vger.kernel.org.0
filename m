Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D89DACBD7B
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 16:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389121AbfJDOiy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 10:38:54 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37099 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388724AbfJDOix (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 10:38:53 -0400
Received: by mail-wm1-f66.google.com with SMTP id f22so6135490wmc.2
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2019 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YJvih0AsR33ViZwBb015+RycjOZ9btNkziiHqgTe20E=;
        b=Yu3JokhAmryrtzowEz6R3vPkgY4HM3KIe667y0r7YQ4WcVmxDn1Sty5y59LuwrVZzc
         m52B+kRGFegj76+8YKRGb5o/DEcFlBpf+7D4ibju5O55VReLIZvH9zcJY4YXm+6GAS60
         9kOTmyKpxxXU+NCumlcbF75BHw3QTClcKtMIXgWN9IFrgQ0F+3Pke17pO0WuqRkgs1aJ
         CEs/JNYIw4K0FfBn/hgjXUdMs8wViWxrXED4l5RRLIXuL0mCG7PCoJqfTUch5PUFr1w5
         wMjWLf9SdLaije47D8IuJM07zmvo4t3afOctbaOOYe/gfmHIDHKtj5nRfYzc2A+KmhcQ
         ecVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YJvih0AsR33ViZwBb015+RycjOZ9btNkziiHqgTe20E=;
        b=LxLDKwvTW0MYzDmjuHFt6xHUEvSBYplhECUWmSIvUmORChbTik5Hu4onJVPUkUdHLo
         UYfhzBoe/opoWQ8kEi2MDIMJHfi2apx39F0NuXgRkufGkmF/+EksfAExFqwo7XbyvXN6
         CFNO3dhz8hFVHPFMfiaj0GJpjnFoJbfIIbafgoPyDixEl1X8sRacTXOLJgk1xJ8vZTXR
         ACcuWu3hhmS5cTo1/GJUSlnHncCjEu9gdPCDZExcBcE37WWUx4qsNJJVXt6TUkWzKtZc
         0X9N5BlF+dx9Qi2Ma8gPdJTOqiwS1m/BX8ZNfMLj4Z3V1K7zoZI3rDAhHRty8efQkDfz
         aQzA==
X-Gm-Message-State: APjAAAUNTv+olJL2uZxiDHjvcoEsaBzrj6/Kwwmfm1qumYzNS5CiUSXL
        b3AOYGkpxNkE/G1G5WbZaPpbtQ==
X-Google-Smtp-Source: APXvYqxaIbrB05oPH5diNroquYYUcFG0Ky2cGHUBNsZqv03BqdPWyrc1uWBrIKxtW+c3tbw7CrOe/g==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr10801719wmi.106.1570199932083;
        Fri, 04 Oct 2019 07:38:52 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id o19sm10233542wmh.27.2019.10.04.07.38.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 07:38:51 -0700 (PDT)
Date:   Fri, 4 Oct 2019 15:38:50 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v7 4/5] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20191004143850.GN18429@dell>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190918145730.22805-5-jjhiblot@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 18 Sep 2019, Jean-Jacques Hiblot wrote:

> Add DT binding for led-backlight.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
