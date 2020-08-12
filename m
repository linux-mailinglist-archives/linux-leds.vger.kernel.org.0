Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FD6242FB9
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 21:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgHLT5u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Aug 2020 15:57:50 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42672 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgHLT5u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Aug 2020 15:57:50 -0400
Received: by mail-io1-f68.google.com with SMTP id j8so4315276ioe.9;
        Wed, 12 Aug 2020 12:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kab3fJEGlaryZqDRGGlxJtcNETlXr7INQvI/406t8ks=;
        b=EAPArnwhFis36563pJCNjGeQEWWNzY4Tfv2Vll8NHzCQrmhwXtJF4MUGWHjMmHLEyG
         3jwuMuDlkssikY6JH52JGrC6H9t2Pvf0M5R8JzyknNBGt5KI0ihsrmhaxoigUJ0T3RVb
         BbDmS5Ip/K2K9aRG+R3AVCJNTmWTqkp6viO6KC8dOXKSliE1uRsmU1ZII2mz0KC1U/Xo
         pAQAsTjW4RpxaTOtjhdckb0GyT2f5NP52z73/Mv5MrCorMeXrFrpn61LmzBnH+xA+q79
         fnKP1ICHQ0ER4Ejs6OmvLkVJG8dbhz5czftMo9JPkOc5qUkQjQNdyscPDIiOpjW+8sRG
         9Stg==
X-Gm-Message-State: AOAM530/Y5sRhxojVCg3FkhUaEDsRbwwYEu31b/+blBM8V27Q5f2hDOm
        fJhfxE8jdsW9xakqjECTXg==
X-Google-Smtp-Source: ABdhPJwzpL961/Irwkpqn3yX+BNDUPZybfwlzFyzjc/fzyX1p6PXT4P353J1oWl99TjZkpU5dwnvxA==
X-Received: by 2002:a02:a905:: with SMTP id n5mr1230537jam.64.1597262269251;
        Wed, 12 Aug 2020 12:57:49 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s26sm1426908ioc.13.2020.08.12.12.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 12:57:48 -0700 (PDT)
Received: (nullmailer pid 2605750 invoked by uid 1000);
        Wed, 12 Aug 2020 19:57:47 -0000
Date:   Wed, 12 Aug 2020 13:57:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     vishwa@linux.ibm.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org, linux-leds@vger.kernel.org, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: pca955x: Add IBM
 implementation compatible string
Message-ID: <20200812195747.GA2605701@bogus>
References: <20200803145055.5203-1-eajames@linux.ibm.com>
 <20200803145055.5203-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803145055.5203-2-eajames@linux.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 03 Aug 2020 09:50:54 -0500, Eddie James wrote:
> IBM created an implementation of the PCA9552 on a PIC16F
> microcontroller. Document the new compatible string for this device.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-pca955x.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
