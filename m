Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA4DA4B56
	for <lists+linux-leds@lfdr.de>; Sun,  1 Sep 2019 21:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbfIATSj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Sep 2019 15:18:39 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41332 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIATSj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Sep 2019 15:18:39 -0400
Received: by mail-ot1-f65.google.com with SMTP id o101so11694062ota.8;
        Sun, 01 Sep 2019 12:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CZBDk6mbhB56f+rg410i/1cUkGakskFz89DEFDY+5dY=;
        b=Mn96XJhOYLuU5yTW4p6Fy7sMNhHcUZPPsJf3xg1nr//hn69KhgoCShZyOjaW1WVxiQ
         gX/Ez6iBdX7jKoBFJBdDztj9P1ty0Nb1+4A8U/6q3+x1/4ZCyxGKjqsgBEv4Zx9uz9QP
         ueEOck89vLCiMl9ReNkJkO18ErCQgFavK654CTAKzFrXPtqHppe2lPCdYzp0ALxZ1ZKp
         3zOtI4E6lo28t+bKdy3Kv6S1xkpl/fBMDeTkzF1+X2mc5cg0QJ3zV8eIMORjQuunYmin
         pA1SEVtUKqsio3XliHYHJGT3zeXZiQLhjSIUCgTs0beqj2t16pAku01yAmkF/RAzVMyt
         6Yzw==
X-Gm-Message-State: APjAAAWEUVJbu4eXbk4GWGH9S85oD9oopSRx7jGqZbfPCm/lqKnnwkFb
        avbMv9NCH9C9ppcAKv6aIQi5Sek=
X-Google-Smtp-Source: APXvYqy8EkuFLlB5Z0a7P//P+uQZwZhCvJ9S843QCGeaPmYZgQ1WgPhAIAlADGqUJuPvwPHgJK2z6w==
X-Received: by 2002:a9d:d22:: with SMTP id 31mr21118802oti.220.1567365518143;
        Sun, 01 Sep 2019 12:18:38 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s24sm3303280oic.22.2019.09.01.12.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2019 12:18:37 -0700 (PDT)
Date:   Sun, 1 Sep 2019 14:18:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Oleh Kravchenko <oleg@kaa.org.ua>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add docs for EL15203000
Message-ID: <20190901191836.GA21686@bogus>
References: <20190830224619.15728-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830224619.15728-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 31 Aug 2019 01:46:18 +0300, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../bindings/leds/leds-el15203000.txt         | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
