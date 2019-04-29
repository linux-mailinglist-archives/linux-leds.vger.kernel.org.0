Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E71DE99B
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 20:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbfD2SA2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 14:00:28 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36228 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2SA2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 14:00:28 -0400
Received: by mail-ot1-f65.google.com with SMTP id b18so467041otq.3;
        Mon, 29 Apr 2019 11:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g0D+oba7J53ugRdqUqKhfZjp5c7iIeT/s8VTipHSSVY=;
        b=JCtLCUlkFh2QKj/YgL1lOBwPOQEUuf0ix3MDbrdiJQhnda1LDYwlhFRVljDi1IRbX3
         fAaQLEIYzIuOE+E5vZGsvokaxIwb58AVAtmdrFtKn1UVz5nzd0MaZI0pXAcqUQNUovtV
         G2LVDyZZVqU0T49we9ZyvSQe1I3lN7MgzgT7bhuooiEMnheCfnSHhLpHildY02vtAmCI
         KP0kzF71CVhret8bOqOVFmoxvXXhHkVrRCkoy5CZ/ESWoZWxPwUtPtUrU4Z5aPLDqQF+
         Em3FitWDLGCHYtGZDArIZXbzMjrhyR1zNu4BlO5HztxRTBEj+fnGafwyYlexSNRbj3Xb
         +Ghg==
X-Gm-Message-State: APjAAAXOMHIHztj4EFAg0+mkycdq75YEdL0l07eImUZWOMkhCM/ocfv1
        Ic9HtD/ArTpHV4WQMarGNA==
X-Google-Smtp-Source: APXvYqw/Ak8dPY20CeIJj6QMYQ/AG9L0qLBnThEixW2CPNlkqEsFNS6fbkCbHa9vdEgs8+Z02lWBaw==
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr9116726otn.201.1556560826845;
        Mon, 29 Apr 2019 11:00:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i11sm13537301otl.27.2019.04.29.11.00.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:00:26 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:00:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: mfd: Add lm36274 bindings to ti-lmu
Message-ID: <20190429180025.GA15562@bogus>
References: <20190410133833.28859-1-dmurphy@ti.com>
 <20190410133833.28859-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190410133833.28859-2-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 10 Apr 2019 08:38:29 -0500, Dan Murphy wrote:
> Add the LM36274 backlight driver with regulator support.
> This is a multi-function device for backlight applications.
> 
> Backlight properties will be documented in it's a supplemental
> bindings document.
> 
> Regulator support is documented in the regulator/lm363x-regulator.txt
> 
> http://www.ti.com/lit/ds/symlink/lm36274.pdf
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - No changes - https://lore.kernel.org/patchwork/patch/1058776/
> 
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
