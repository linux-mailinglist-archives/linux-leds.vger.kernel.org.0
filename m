Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6981C60A8
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2020 21:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgEETDe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 May 2020 15:03:34 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33157 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgEETDe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 May 2020 15:03:34 -0400
Received: by mail-ot1-f65.google.com with SMTP id j26so2666657ots.0;
        Tue, 05 May 2020 12:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rltowIsU/RX+KwHoE8r4JocAq1x5HMLCxTuqb1yIep4=;
        b=a3MP2A55hyBXI1Lx50h3jthpaonNZIicgOxU5qhXmpi+1qdeXjdi6pKcLG07+AuKU4
         27CQRHrAZppqJz0FDMDLd8q/CrbfHa8zNayD+MrHM4+QDrQ0XjdOnta8jzQWbK2GYWz9
         fzThULL4Z86I2Cn7eteS9ReGl2Erw0yrsjZD0yx48gXTe7bVDHfMRsv2VEQcZZU8mWG2
         uGDrtxXxrQtRspO1f7EQSn4NGC9Gp41t/OuqQYVM7BcuLKzyISVyprwdn6MVjyrEXsFT
         6/Y21S6vqyM47+UTeXdcfIN+JPawDsswmB7y+Bp2LosKvPE1cJWfAvBQV+r3+KrwvckO
         Yw+w==
X-Gm-Message-State: AGi0PuYBL2UvdTxOLojWxzxDwI0rCGnQetceYIfk7D0z0IqdAjVpQ/CE
        oIttyN8aJsrYYtuDOVXPlA==
X-Google-Smtp-Source: APiQypJwkfA+D6zkGo1Z1qO/bvY0b844rxJMKdutLVPWTZ/m7e8cpvA3Yj80e8zScxt9f4KVVm4xcg==
X-Received: by 2002:a05:6830:1e39:: with SMTP id t25mr3673735otr.114.1588705413026;
        Tue, 05 May 2020 12:03:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k8sm786584ood.24.2020.05.05.12.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:03:31 -0700 (PDT)
Received: (nullmailer pid 12291 invoked by uid 1000);
        Tue, 05 May 2020 19:03:30 -0000
Date:   Tue, 5 May 2020 14:03:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 1/4] backlight: qcom-wled: convert the wled bindings
 to  .yaml format
Message-ID: <20200505190330.GA12221@bogus>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020 21:03:34 +0530, Kiran Gunda wrote:
> Convert the qcom-wled bindings from .txt to .yaml format.
> Also replace PM8941 to WLED3 and PMI8998 to WLED4.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 ---------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 208 +++++++++++++++++++++
>  2 files changed, 208 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
