Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F27B2974D9
	for <lists+linux-leds@lfdr.de>; Fri, 23 Oct 2020 18:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465798AbgJWQs5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Oct 2020 12:48:57 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45744 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465779AbgJWQs5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Oct 2020 12:48:57 -0400
Received: by mail-ot1-f66.google.com with SMTP id f37so1928437otf.12;
        Fri, 23 Oct 2020 09:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t41Wz1ftPJdXoRBo6WvXtJCsvezv0jqP6YqdxmMi1Bc=;
        b=BU2XYLGaYNiJG1++zXuJf5XdXlDoDAJehIk50hyQTVdXnFe2FKqLaIpao5JrP5sAvf
         s3JR/SfB5dMpyUuYltjpUD+v6bplgByO6R4V/sivHbz1J+3tyigOsSoCw2bd9YiBsQFs
         dP6JxyeEIBu5cfCsjsURrTE3Oxh9dDMUwwRicW2ho4vga6qjlEfsHoc4CwWV+DvJ4n8c
         HJ+1CWZRsuM3u8kEzA/0vceSzap+G1MZLBZ8NQFto42uFd3o6UHOHQyyAa7RcTkBaQ6Q
         sY1DFqlY8u2gKYK9SNa8vntnagxK256B6X7HnRmBBuOE/YyhpEtYqC3y9bqzBliPrLw8
         KQTQ==
X-Gm-Message-State: AOAM533qNV0ELNaouwgGmGS3TJUbvRlJzcm8a7oJKtp5TmodgV/cTTgm
        UHj1TwObbYYlyApjZLObeA==
X-Google-Smtp-Source: ABdhPJzfGSbMJv/KSQd6oguikGdkSvbMIqgnr+wSNyj8vVZh/6asblfBhCslPDOELSEjJGqwDkH/PA==
X-Received: by 2002:a05:6830:13c4:: with SMTP id e4mr2212329otq.142.1603471735136;
        Fri, 23 Oct 2020 09:48:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j7sm507432otc.77.2020.10.23.09.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:48:54 -0700 (PDT)
Received: (nullmailer pid 2850563 invoked by uid 1000);
        Fri, 23 Oct 2020 16:48:53 -0000
Date:   Fri, 23 Oct 2020 11:48:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Zhen Lei <thunder.leizhen@huawei.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, pavel@ucw.cz, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Update devicetree documents for
 ID_RGB
Message-ID: <20201023164853.GA2850155@bogus>
References: <20201016115703.30184-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016115703.30184-1-dmurphy@ti.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 16 Oct 2020 06:57:03 -0500, Dan Murphy wrote:
> Update the leds/common.yaml to indicate that the max color ID is 9.
> Reflect the same change in the leds-class-multicolor.yaml
> 
> Reported-by: Zhen Lei <thunder.leizhen@huawei.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml       | 2 +-
>  .../devicetree/bindings/leds/leds-class-multicolor.yaml  | 9 +++++----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 

Applied, thanks!
