Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB933E9A5
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 20:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbfD2SBK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 14:01:10 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39063 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2SBJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 14:01:09 -0400
Received: by mail-ot1-f68.google.com with SMTP id o39so9477858ota.6;
        Mon, 29 Apr 2019 11:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6fbPzXnXB6Vp6WncMpX55LkZOuYphLh5OWRciNnocpU=;
        b=IPhybX4Ck1wZPe4/c62v56+yOrmrTxFlT/ErcoMmx54VWg6KLxRGMCPF+xIcJC+ab7
         eTP88l45KawRnt1dhkg07QQqThsmG01G2yUCEpgnPorSgPEcSvl1F6GYG1XrxZpN+iyl
         REZcftiz0uHNhl4/8F6uw76VVUu/woqlxqmm7UpY2L43FtfQgt+nhJOBW6V0JHQWREYQ
         WtAA87qOxolKcQti3gGj6GahAN+D59fS0oKuxtAhifQXoSO+7QNXArJIyloV/5Qiwbuy
         yrlFZwCFVvhAk76Gp/Wh+M54XMUab2jL+9Z2WIHd3EWIvTnjzxYz3Yogy7gLvpiIlxYi
         jl/g==
X-Gm-Message-State: APjAAAU/yMTq0QQtyLXeP2SZzpULaSeqeB47JsvBR/LXMAcSFIxesLFk
        LnRf+vJUhI7XOhKBsMj2gQ==
X-Google-Smtp-Source: APXvYqw8Bnd8vDhZrz8kuIMOll3IKLa84f7Ce34xWmKRu91IjyzdfsMKmHcH9Jlcn5bRqbMwe+ALKA==
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr19483523otl.154.1556560868635;
        Mon, 29 Apr 2019 11:01:08 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h129sm5378076oia.12.2019.04.29.11.01.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:01:07 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:01:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: leds: Add LED bindings for the
 LM36274
Message-ID: <20190429180107.GA16969@bogus>
References: <20190410133833.28859-1-dmurphy@ti.com>
 <20190410133833.28859-5-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190410133833.28859-5-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 10 Apr 2019 08:38:32 -0500, Dan Murphy wrote:
> Add the LM36274 LED specific bindings.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Changed 29-V to 29V - https://lore.kernel.org/patchwork/patch/1058779/
> 
>  .../devicetree/bindings/leds/leds-lm36274.txt | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
