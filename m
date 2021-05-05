Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BB3374BAF
	for <lists+linux-leds@lfdr.de>; Thu,  6 May 2021 01:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhEEXGs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 May 2021 19:06:48 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:43817 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhEEXGs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 May 2021 19:06:48 -0400
Received: by mail-oi1-f177.google.com with SMTP id j75so3739807oih.10;
        Wed, 05 May 2021 16:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MngNvYwOHxEk6uk+PqkoCOn4yX8WrY5NS/V34QIKjJw=;
        b=VQYi1uyPN2BvCpUQpHpNYFlyCrPG36FhZdgDFn2Sc3pFNAsrIxH5fRjpr0zpSd9I1i
         Kih1M3Q2ZI5om2J/tcwka+2wuYyeZ0ZEFWntuAs1tvzeNctKLThd9oVNZRJKNzIcwkJC
         beNivbOWY8CiUO6jOfQlRZBueHqb/AmdQDg1hj4kEgfULxRpzhDKv7yhVLVP+t4ohTUZ
         5kE4vH5ota9CKXCtLUi3lawKMnjrJtoz7VvQmaYoVPYELBe2VfyjWRpcDu0Uyi+lZ/co
         xZNky0aJXX/4NGhQuWRA+T5cTGESUxng2mBmpePy83GNfGGL4EzHUS4DdNMTldk0w2Uv
         evzg==
X-Gm-Message-State: AOAM532AuJELgR79KthVrx/QMDZo7z1rH7uM6C2/gal64XxfoVPnaPWk
        h3VN81FFsl+3LKd3Inpha5TjLTveSQ==
X-Google-Smtp-Source: ABdhPJwBwpPBDjdYr7rrCEl5VZZEFfefkXKjkjiQIJKCVdQQjTO5+dLgXZpLVmSdhon+TRyd8WA4QA==
X-Received: by 2002:aca:eb02:: with SMTP id j2mr8546575oih.92.1620255949934;
        Wed, 05 May 2021 16:05:49 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a4sm125046oib.17.2021.05.05.16.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 16:05:49 -0700 (PDT)
Received: (nullmailer pid 3009072 invoked by uid 1000);
        Wed, 05 May 2021 23:05:48 -0000
Date:   Wed, 5 May 2021 18:05:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, robh+dt@kernel.or,
        linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com, pavel@ucw.cz
Subject: Re: [PATCH 1/5] dt-bindings: leds: Add retain-state-shutdown boolean
Message-ID: <20210505230548.GA3009010@robh.at.kernel.org>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
 <20210429205002.70245-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429205002.70245-2-eajames@linux.ibm.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 29 Apr 2021 15:49:58 -0500, Eddie James wrote:
> Document the retain-state-shutdown property that indicates that a LED
> should not be turned off or changed during system shutdown.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
