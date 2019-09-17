Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 698ACB5513
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2019 20:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbfIQSOr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 14:14:47 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46279 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfIQSOr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 14:14:47 -0400
Received: by mail-ot1-f67.google.com with SMTP id f21so762582otl.13;
        Tue, 17 Sep 2019 11:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XSRRd5vWW2vpEVhgOqafpOwtu1MzJvFddnvMtX5f1Nk=;
        b=YGYRsvRECX4im0TMlrTFUKpxHgE+YOYpFjFHBgVpTXzze1rVNuku3sCG+F4Yr0qksB
         gRfVD509XdNjgpj9xoF8gTgite9srynTWd+EiYdQquZw9Oy+ETbWKy2kMHAW1215Crtl
         vO3yNRuKZKGg7K/TeaA3K7A/GaDHMkaS9fss7rS0phQXwbTBU0Ghzaev2X/6qJEMLFaj
         oe1l7dQsGe0U/xPq9Hv3m4R4tTMj8yXHDeQQXNtAAKjkEB3qDbq01jwAswEtSyT8oMgd
         OK3LhG7XGspJz7d816MtZCbRHoObzvpZJ6dTbMwbjF8L4x6H9+aOFu5jq7HvpOOm9o1/
         ep4Q==
X-Gm-Message-State: APjAAAU+Z7xn7tqE3+QL2iL6rdp9ycsysxHZ3F2L4O/XV96vW7eVpU6m
        p1VIwEacfZbtxHntN+Ipxw==
X-Google-Smtp-Source: APXvYqww8yJFPN4q1LhdZYjt+nN+vXnbu55jZRHBuSazrmBQs+/z3xJkghpDdj5UB0GrxG9TOlHVUQ==
X-Received: by 2002:a9d:d28:: with SMTP id 37mr110445oti.279.1568744086440;
        Tue, 17 Sep 2019 11:14:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 60sm347183oto.27.2019.09.17.11.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 11:14:45 -0700 (PDT)
Date:   Tue, 17 Sep 2019 13:14:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20190917181445.GA2875@bogus>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Sep 2019 23:32:56 +0200, Andreas Kemnade wrote:
> add enable-gpios to describe HWEN pin
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> changes in v2: added example
> changes in v3: added Acked-by
> changes in v4: moved enable-gpios to the right position
>   in the example
>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
