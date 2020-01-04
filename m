Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A2213048C
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jan 2020 22:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgADVMC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jan 2020 16:12:02 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:38031 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgADVMA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Jan 2020 16:12:00 -0500
Received: by mail-il1-f193.google.com with SMTP id f5so39365847ilq.5
        for <linux-leds@vger.kernel.org>; Sat, 04 Jan 2020 13:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=B0Hpin+TA8PZ/UPU++QRg3TQKcelVhxJf7UGPi4P5JQ=;
        b=D+0WfPtRYfQUoCT4u4NBB5r67oLSQA0pOqs1mudrzc0NX4XBH95yxrSwqY3BEiOkP0
         YzRTnVxfSQIaVRzGYbSKR3CKMN2yclsOF/APN3pO30RybJl6exRcSlkzFeoopal10yOc
         ZGkqKXTjIScsy6ZPjNpAjFkh7q+r8ld6wgt5qqjfiL7H2GLVBLc+Oh8gqaNL08nntYlM
         2HAu8bjRqWTw7YkJ2GAgoYptnbwcKgznWTJOyA6k2Mw+2LmTE/MK6DtN5+fUUQMqM8o0
         2pc2hzyY0iElzpm5rMZ4nLzyFBO2yBmS8EueOboEJmzNk/luIcMuzVUaWOpbqI++qaKN
         8swQ==
X-Gm-Message-State: APjAAAV3T8keOrideYo7GFZXFoSYeqKi7JBd3VW+ShYwfNKonfr5JGS/
        RnvN+4KZC5rVbLcYyAHU/IudXLI=
X-Google-Smtp-Source: APXvYqy6DJuL3A5VYn6p1bpewrNUSDuYdX1pI7lPPQhzI1m7L4RxQ+ltUBd6Iafk74zMS6+BJ3GDzg==
X-Received: by 2002:a92:7ec9:: with SMTP id q70mr57945176ill.185.1578172318630;
        Sat, 04 Jan 2020 13:11:58 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id l4sm15610217ioa.9.2020.01.04.13.11.57
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:11:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:11:57 -0700
Date:   Sat, 4 Jan 2020 14:11:57 -0700
From:   Rob Herring <robh@kernel.org>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] dt: bindings: lm3692x: Add led-max-microamp
 property
Message-ID: <20200104211157.GA21511@bogus>
References: <cover.1578134779.git.agx@sigxcpu.org>
 <015c9818d17d81783614da2b89ec46283468765b.1578134779.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <015c9818d17d81783614da2b89ec46283468765b.1578134779.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat,  4 Jan 2020 11:54:21 +0100, =?UTF-8?q?Guido=20G=C3=BCnther?= wrote:
> This can be used to limit the current per LED strip.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
