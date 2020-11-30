Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DB12C8FC1
	for <lists+linux-leds@lfdr.de>; Mon, 30 Nov 2020 22:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388498AbgK3VOo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Nov 2020 16:14:44 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:33473 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388496AbgK3VOo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2020 16:14:44 -0500
Received: by mail-io1-f68.google.com with SMTP id o8so13376191ioh.0;
        Mon, 30 Nov 2020 13:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K5QWl5ei9jV340XmIr+pmfuIbJrWkKit899MIYPp7AQ=;
        b=M+ZyNfRbZcd4mo4LBJXzMtynpGNimQztfXJHZVHqijjjtkOFV6Mp/His6hm/+aS9cM
         QhsORov5rOlCoQSdWj1yPNQpjYkcomr8Gva0dlEKY/aBs0CuC9YpY5f7OJqiMdHKkwAp
         GSQD1i6xGDALuQCGTN+0v5ZqSY5cQ6z3R4EUi2YCD6ITFIkRmMFgX2IgHL9ZdnEI9Qj8
         /kVrNdf4i7AFQDKctzLn2UrphQqV4DhGIYv8so5PM6nUT7Q1Gzm82R7xSyyvVI7yrl5M
         FIt7LYxNlesdFpcHYcV+GHPqo26ErYUXz0426gCb9HU5DLZuqUuE3AtyIBdI79FIHz0r
         HycA==
X-Gm-Message-State: AOAM5332wnSr8GMz7OmOOILssVN185X+MTzo6kuRNqzlD7nP9c+HBwLd
        GSTMk5tQnR35idOyc573/g==
X-Google-Smtp-Source: ABdhPJwBTvy1PvPrfL4c8jdviKMqeXkkN8UP70aRUeHPx0vOFpZKGah2bqoIkQwF0Nj7tYtd1l33JA==
X-Received: by 2002:a02:90ca:: with SMTP id c10mr21877924jag.115.1606770842954;
        Mon, 30 Nov 2020 13:14:02 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v22sm11951854ila.84.2020.11.30.13.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 13:14:01 -0800 (PST)
Received: (nullmailer pid 3033265 invoked by uid 1000);
        Mon, 30 Nov 2020 21:13:58 -0000
Date:   Mon, 30 Nov 2020 14:13:58 -0700
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v10 4/6] dt-bindings: leds: common: Increase
 LED_COLOR_ID_* maximum size
Message-ID: <20201130211358.GA3030232@robh.at.kernel.org>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606447736-7944-5-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606447736-7944-5-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Nov 27, 2020 at 11:28:54AM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Increase LED_COLOR_ID maximum size for LED_COLOR_ID_RGB
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index a2a541b..0c9f912 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -43,7 +43,7 @@ properties:
>        LED_COLOR_ID available, add a new one.
>      $ref: /schemas/types.yaml#definitions/uint32
>      minimum: 0
> -    maximum: 8
> +    maximum: 9

Already in linux-next.

>  
>    function-enumerator:
>      description:
> -- 
> 2.7.4
> 
