Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01D58180666
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2020 19:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgCJSbX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Mar 2020 14:31:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45256 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgCJSbX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Mar 2020 14:31:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id f21so14126283otp.12;
        Tue, 10 Mar 2020 11:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kE8zJYod7DGw/iirznrwm04icms4ZonrW+m7De0Huos=;
        b=tSgqnoILJO40vmXhVI6xPFpcIjeTu1NY8MVBWwOp0dkkpGIJOvxcGOq5562QZFwxmo
         iHTpES6+SthX0zWQ/ZtVgiGk+gfBrmRAQ4TMS/nmgr5WnacdREt3KJ8CeHVVR5r3b+gy
         vvLAiiPd1bD+2h3s/kcAPfnmjCDEDO28tX+dcdv0XUSb8zqAKw147h2S7Osa3HXlNm9A
         DZGkNmuLBEiay6H1WkIpffoll1j7NQb2PCcsZFKZI8vKz360HjsGmNI6C0LtMVqLPkJn
         Gt7Gb9xWujor6y21VtgYTPYqWUlAL5qSG2At9DWA0+y/eBGvFEVVU6VYbuJNlZI14sRM
         XjQw==
X-Gm-Message-State: ANhLgQ3eb1sugpOt6TN+1R3xeLOzuqrA+B7SyYTVbUE3+JONbfRhyW57
        Q9/wihhIrSbURoOOEe5LNg==
X-Google-Smtp-Source: ADFU+vs6BXU2RhaGOMkzDNdE03Xyflh1TY7gz7r9610og46G77Jwujiyd6QdA37f1IfNWYINzkfbHg==
X-Received: by 2002:a9d:21b4:: with SMTP id s49mr17315918otb.294.1583865080731;
        Tue, 10 Mar 2020 11:31:20 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e206sm4490498oia.24.2020.03.10.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:31:19 -0700 (PDT)
Received: (nullmailer pid 14370 invoked by uid 1000);
        Tue, 10 Mar 2020 18:31:18 -0000
Date:   Tue, 10 Mar 2020 13:31:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org,
        Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V3 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200310183118.GA13818@bogus>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583760362-26978-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon,  9 Mar 2020 18:55:59 +0530, Kiran Gunda wrote:
> Convert the qcom-wled bindings from .txt to .yaml format.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 -----------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 184 +++++++++++++++++++++
>  2 files changed, 184 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#

See https://patchwork.ozlabs.org/patch/1251567
Please check and re-submit.
