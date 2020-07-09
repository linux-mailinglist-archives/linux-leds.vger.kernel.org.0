Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E92521A7B2
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 21:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgGITYY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 15:24:24 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40407 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgGITYY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 15:24:24 -0400
Received: by mail-io1-f66.google.com with SMTP id q8so3538903iow.7;
        Thu, 09 Jul 2020 12:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UIqCztKevCneF6ioGbTspyIoGpmry5+/Dok5gYJ3WyA=;
        b=Bfb0fLGfoHm3W+w9nuLpz5fVIcUfOfykOP4lgs6AcF4wtQlZ5vI8C+YuBDZg+Rhwz+
         nLGeiyogZPbsImBITwgx1cBJltMxKhvb0gjlD54YD/c1F9ZrnObTzoImdTmvVGP1Lh2v
         ZL6a4gCB2DqEgtJxzK3YYa5AuRBv37GrclcYQdTDUJmSCKluY/q0oEGc8fqxvLArC8tf
         kIl4M5hwZSElNY0WIadxD///xJE8SD7yaxHJEdQieTEUK5k0Vmuk+sRGmHthWcpP6oJG
         Z3+EJPRJ8xZOfZt0tfOfM+G5zPgnMkrGQGsTbBg2Ir/3Bbgo6IOmQMv8MSfCWePD0iFZ
         euiQ==
X-Gm-Message-State: AOAM531P+E4IDegWuB/wg9ncJFjOPiWJ5BUOjqeLHrinvq/R3N7SybPf
        oU4TtPC7sfk150Xa/9DXsg==
X-Google-Smtp-Source: ABdhPJzaUxygIC2tbULNK/BDA6hFWcftrUrUMq9KH6e62eedm3LwsJzQia+bXGBLxytk6b1Iei/pmA==
X-Received: by 2002:a05:6638:1187:: with SMTP id f7mr74696113jas.58.1594322663539;
        Thu, 09 Jul 2020 12:24:23 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id s17sm2717111ioj.10.2020.07.09.12.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:24:22 -0700 (PDT)
Received: (nullmailer pid 748212 invoked by uid 1000);
        Thu, 09 Jul 2020 19:24:21 -0000
Date:   Thu, 9 Jul 2020 13:24:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     devicetree@vger.kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH v29 01/16] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200709192421.GA748160@bogus>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622185919.2131-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 22 Jun 2020 13:59:04 -0500, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.
> 
> CC: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../bindings/leds/leds-class-multicolor.yaml  | 37 +++++++++++++++++++
>  include/dt-bindings/leds/common.h             |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
