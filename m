Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C658E930
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 19:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbfD2ReX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 13:34:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44078 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbfD2ReW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 13:34:22 -0400
Received: by mail-ot1-f67.google.com with SMTP id d24so9349717otl.11;
        Mon, 29 Apr 2019 10:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0XjhLzz/Sv+9Eags0QObjYlexjOysZAe8RyevUE1lSI=;
        b=i3g4LXgGxu4vk5i/RoA2J6OjlFbdIKNzSbVTgJAiWzA8go8oZfAHpuYAb4W9+Ybehq
         YIUx4u4usFXp4DP3OF8Y1SHEKw3Vr9IEv+TSQNUGP4r9IocswS1vrNtNgWSHT+F3y39s
         AqmGa6/2T7w79y8iL7KzT/STA0z2eU/EOIPLAeoCZKFcMbZW5xADjpj/YXtVQuoiHdb0
         WUU8HsB1Kt4YErGh3Uq9Y1BTkaEGlFhLJ7PhCHWjY4vJQhX8mr28UX2DhKwJp4o5ehfD
         9GSyprpjIZgmSBGme5xNzu5zbAi1RUxiFsdgmWFdztU6lRynrvWZpWDQVdMfVEufzjeI
         RPrw==
X-Gm-Message-State: APjAAAVENUhH5DbXMacLp3fCuNDoAp545kRcHKO8ZyjQCh3babOEFgea
        OkXZMQms853yLK46GH0K/Q==
X-Google-Smtp-Source: APXvYqwKvzlwTuoEiQya1QujR0i/jv49H1pSYu4XaeHD7fxP5JxXLR1+czGJq3AcZGkp/ZZIiw2RMg==
X-Received: by 2002:a9d:7e99:: with SMTP id m25mr1130215otp.7.1556559261978;
        Mon, 29 Apr 2019 10:34:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k65sm14497146oia.16.2019.04.29.10.34.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 10:34:21 -0700 (PDT)
Date:   Mon, 29 Apr 2019 12:34:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Message-ID: <20190429173420.GA1273@bogus>
References: <20190405142855.3969-1-dmurphy@ti.com>
 <20190405142855.3969-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190405142855.3969-4-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 5 Apr 2019 09:28:53 -0500, Dan Murphy wrote:
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
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Made changes to reference ti,brightness-resolution to the ti-lmu.txt -
> https://lore.kernel.org/patchwork/patch/1054501/
> 
>  .../devicetree/bindings/leds/leds-lm3697.txt  | 73 +++++++++++++++++++
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 27 +------
>  2 files changed, 74 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
