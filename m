Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E517B2A355C
	for <lists+linux-leds@lfdr.de>; Mon,  2 Nov 2020 21:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgKBUqQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Nov 2020 15:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgKBUox (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Nov 2020 15:44:53 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CD1C0617A6;
        Mon,  2 Nov 2020 12:44:53 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id 7so20763995ejm.0;
        Mon, 02 Nov 2020 12:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZQv/n+Pc9gBufpL9P6pIO2ZINXQcbOdsmattdguwTpU=;
        b=UTrUitm/iFhoWSEF85q+yqCp6MJqJjJgTV8nE8lIAXmJsobPMZjm8SKfw+m2lYCgVZ
         tvd94mMJ4JAt5GX7E3u3WSAn3ghS/JybNRh6Wshh+/S2aKCH7VxF2X/mqpq804FPQeEA
         /K+6bi9gEg5hUU00OVeSV2itQq96P+ZVqfiRQt1+KgvzaPv0NMCuzSEcsjUJZAZHdBtf
         TLyj/TFTfjZYkoaqTylAm/ne4oYCNYXxRLGEIMQMbINzbH6Vl6nlcIt5RDHa+x0grlsm
         coTWqIXrgQT3xtXUdnwvQg2XMMGVLUaM6E7lx47IWrWqh5VJGMzhDfP0hSMRZg1c2LcA
         xAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZQv/n+Pc9gBufpL9P6pIO2ZINXQcbOdsmattdguwTpU=;
        b=HmwAmXDeQnGQ+iMBU5BbvFN/8mNoDlP6ZLYPFNMHGCM14jKCk95yDIO8rF45W6pb/6
         obWDKmoxQkZnKj0PKsazDQVlGOCzWtWCRh112Pzl/OBw0fw5ShYYxRr97JBd+nF+7bua
         M3C9qM+85U2wMh61wjonkwlJ4fhGYiyaToqKp3Sv5Ay/oUVBzFB9j/k9e5kl8wTNG408
         ZA5O0CfGgjthbP2Y5THsgcP0268lwlKWheJpgJiyE5LtbYuAFg9y4P6USAgauZo/gKq9
         kGUKIhUqF8u3SWUre8FS+bkHt6saC/EmUAbPOHnuLQlqTDEvC8i6w3ktx2DMHzcMhT2m
         P5fQ==
X-Gm-Message-State: AOAM533gGBx68ydS65MA210GUD4FyYnqpCljDy5FoeSGBSxGVrkP2LED
        /nWK/XhAVOh3Y96D6hdZ9ie8VvGPFdg=
X-Google-Smtp-Source: ABdhPJzYXHsBLvi55P1UZFx56hbwWS3tJBwAzM3b0wkhceNV4ZIflZenWgtXLCtu2uycKweqMlQdWw==
X-Received: by 2002:a17:906:7805:: with SMTP id u5mr7762253ejm.379.1604349891925;
        Mon, 02 Nov 2020 12:44:51 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:f8a5:eb38:336d:d2dc? ([2a01:110f:b59:fd00:f8a5:eb38:336d:d2dc])
        by smtp.gmail.com with ESMTPSA id u14sm10821756edv.6.2020.11.02.12.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 12:44:51 -0800 (PST)
Subject: Re: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 LED controller
To:     cy_huang <u0084500@gmail.com>, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        cy_huang@richtek.com, devicetree@vger.kernel.org
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <3cf3ee50-3dd8-d3b1-66a9-cea2ba487de3@gmail.com>
Date:   Mon, 2 Nov 2020 21:44:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi ChiYuan,

On 11/2/20 3:42 AM, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add support for RT4505 flash LED controller. It can support up to 1.5A
> flash current with hardware timeout and low input voltage protection.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Changes since v1 to v2
> 
> - Create flash directory into drvers/leds.
> - Coding style fix to meet 80 charactors per line limit.
> - Refine the description in the Kconfig help text.
> - Change all descriptions for 'led' text to uppercase 'LED'.
> 
> ---
>   drivers/leds/Kconfig             |   2 +
>   drivers/leds/Makefile            |   3 +
>   drivers/leds/flash/Kconfig       |  17 ++
>   drivers/leds/flash/Makefile      |   2 +
>   drivers/leds/flash/leds-rt4505.c | 430 +++++++++++++++++++++++++++++++++++++++
>   5 files changed, 454 insertions(+)
>   create mode 100644 drivers/leds/flash/Kconfig
>   create mode 100644 drivers/leds/flash/Makefile
>   create mode 100644 drivers/leds/flash/leds-rt4505.c

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
