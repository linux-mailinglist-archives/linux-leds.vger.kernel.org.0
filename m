Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A0A2A0E31
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 19:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgJ3S7Q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Oct 2020 14:59:16 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36733 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgJ3S7Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Oct 2020 14:59:16 -0400
Received: by mail-oi1-f195.google.com with SMTP id d9so1694597oib.3;
        Fri, 30 Oct 2020 11:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vMBIyMUlBrEcQlciDxDXiIdqa41BHi05WIMz48oNq0g=;
        b=FgVNRdk8fDBob3QU5zaBGpnx8utyUukl7aBxQmk3bSae+uWdIY4RYT64tqDiB+qBYk
         mSmz7mkyMCsJLZcvu3zuip4wYr4aclRxKqrKOJ1FT0dKN8Ha9aKt6pUeT2n2CGTusWam
         12cTTNCN3GDqYNpuOUf+vQHE+ifjEc5+moAJ7htZQqXL9Ia2MyuabMp4aYsxKLJEZBEW
         HzYXvCsGXmvKWaJRPpNC8f9Bstbe4Etma61E33ki9S9r8sy58IngCmVznw3n7MuQXDYW
         FZnIjQTif+a0PPa+pKDGSqn1PPBbpMT/UhLrNlUoP35hPqM3H3IDeTyzF8b38cceQfnY
         y4uA==
X-Gm-Message-State: AOAM530mNTGld18jBK0o204JSVipxx4QPwr5U6yQ0CMEA9tFCCrhG4Bt
        GoN/v/zHmDm4dIMQbt8Bog==
X-Google-Smtp-Source: ABdhPJzo0GHeNsVCmC1cRNr5h0jZEf5NiMo+QojfN7yhg25NT/B/HXEkdBEpJ0TRWW9/tPmCxakmfA==
X-Received: by 2002:aca:3882:: with SMTP id f124mr2402548oia.111.1604084355359;
        Fri, 30 Oct 2020 11:59:15 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q22sm1537142ood.32.2020.10.30.11.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 11:59:14 -0700 (PDT)
Received: (nullmailer pid 4147475 invoked by uid 1000);
        Fri, 30 Oct 2020 18:59:13 -0000
Date:   Fri, 30 Oct 2020 13:59:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com,
        linux-kernel@vger.kernel.org, cy_huang@richtek.com
Subject: Re: [PATCH v1 2/2] leds: rt4505: Add DT binding document for Richtek
 RT4505
Message-ID: <20201030185913.GA4147421@bogus>
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <1603784069-24114-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603784069-24114-2-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 27 Oct 2020 15:34:29 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add DT binding document for Richtek RT4505 flash led controller.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-rt4505.yaml      | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-rt4505.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
