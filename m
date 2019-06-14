Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 745F046540
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2019 19:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfFNRAh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jun 2019 13:00:37 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44360 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfFNRAh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jun 2019 13:00:37 -0400
Received: by mail-qt1-f195.google.com with SMTP id x47so3239273qtk.11;
        Fri, 14 Jun 2019 10:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1eI9x8aqHa2g6lRAb8xIaUpLrr30zti0UHmU+FDhYtY=;
        b=pmb/45gKucIk2xGPGaDtYIsNIRQxKDuQ0s0m19ZddNEm/0nUMKPP4kO6xuqX1zQn+H
         IA6zufiYT/7har24Wkyj5y1f05ZhugH+yAjeQ188uSsDy9737l1zE7WMD+M6RkVMpP9f
         jnTpUqOZPUtopu16gyP3yoSucZHah1bdpMHpjMQhdFZIWOgaT+/V1CwP+sfiY61x3uOv
         IF/1w8aLVyh9/7tcO0MDwwk0LkHqVfoSuihgzTOWE3HUzrFRNnnj9nVyl0aqcxMPhHZr
         ckL+dD4XAiAX5NDJPPC/xziqkmM3PbOupZxN5x+zuL6ysRt/cdWHvU4OOKuCOTYfAFuE
         IH2A==
X-Gm-Message-State: APjAAAVVjAxVhAffn1Ogx/8HL3XXlriRqaq+exAheFTAkNmeFRaSDcCO
        HzR9Ig7t8L+iUzvPO5808Q==
X-Google-Smtp-Source: APXvYqwZrdYRPp5o9112ectPkp5A8tin2+VsST5o2plnaFhhOgISNCAl7ax/5gjW4QbLlrcgKJnHpw==
X-Received: by 2002:ac8:2cfc:: with SMTP id 57mr80288786qtx.194.1560531635897;
        Fri, 14 Jun 2019 10:00:35 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id d3sm1536126qti.40.2019.06.14.10.00.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 10:00:35 -0700 (PDT)
Date:   Fri, 14 Jun 2019 11:00:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: leds: Add multicolor ID to the color
 ID  list
Message-ID: <20190614170034.GA7789@bogus>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-5-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523190820.29375-5-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 May 2019 14:08:15 -0500, Dan Murphy wrote:
> Add a new color ID that is declared as MULTICOLOR as with the
> multicolor framework declaring a definitive color is not accurate
> as the node can contain multiple colors.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  include/dt-bindings/leds/common.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
