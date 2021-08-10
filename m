Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8932C3E5C4B
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 15:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242040AbhHJNyq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 09:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236814AbhHJNyq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Aug 2021 09:54:46 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D999CC0613D3
        for <linux-leds@vger.kernel.org>; Tue, 10 Aug 2021 06:54:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g30so9432135lfv.4
        for <linux-leds@vger.kernel.org>; Tue, 10 Aug 2021 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwWuIJqiBzpe1+2G6GtRorjiBXRmpvLNd3Ic9h54t+Q=;
        b=W8fomkKIUYVT177erd3QXdCb9N+w4GU7xEHCTq5V+/pLfs4vtKwHrQWVUWoJUa0WKb
         yROIoySSTQNgzo/gwzIxqRF0R5bfQS+nDpd4VtEzC7ELr7a7smTBhEYmnBQS7iU28eFl
         6/XmILEUsrPbVSQo2USlm6N8PSX516JZiNcZJXsvUVhtLxfMxR0eLAOF6GrZr45uhpYA
         i7Yq+yxNWPQ9DzLISfpIM6HOHFoZYWG8HkNOCTHmLhZ4GupDBs4AmopLoCHgMdalRbIB
         DLdHvCypgf5HJo3jpK3W4lZxDXnfAGL3udivEZnwKrCtcdQJBxxszPhgqQXRt34MHJsX
         q8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwWuIJqiBzpe1+2G6GtRorjiBXRmpvLNd3Ic9h54t+Q=;
        b=TuKgbvIPL6SbIzDmqfRD9inkHD5EIpxf84QdGgL0zlt6oYSs0Xfu1rC4lfb9ofX8E0
         gEcDol5e6aoO/8+uSEfXJ3536H271VQ5tYZRxcGN6NZfUeLR9oXYuQZAYDpY+BMF9MCi
         KkE6rOqcBgakXxwk0VVCqiDwdLgMS3a08TljrPV7mWDvJjY6j2CpMcCPU3hMFOEickLr
         kaUpzjSr4KovU2wiCPTn+SeOtk283n4IL/HOw1wrca199NtZHRjA3YLxsvPn4dDQiaTy
         fbWMRic9/ixgUl4QcNWBSEkYJE5Rj2pe8gT9i574Po3HqU2mtq4nXPdOjRXF2Mdvwz6X
         VJmw==
X-Gm-Message-State: AOAM531xEEne+Lc0w3R9msgEuiY1OMsN8fvPYDLxAgLiZZ6D8xovFvQl
        qwlsksm4Nfnjurd8XVZBk21CRZ1erFkYUltrxqmULw==
X-Google-Smtp-Source: ABdhPJydL53OBU+42r6QKcJIZe4IlQ/SoqsP/bpkjgaMcCdQZB8nlKWRZ68tmLNyMtyFuqJpiUzbjuD8656QAXWk9KU=
X-Received: by 2002:ac2:4d0f:: with SMTP id r15mr21366821lfi.649.1628603662266;
 Tue, 10 Aug 2021 06:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au> <20210723075858.376378-5-andrew@aj.id.au>
In-Reply-To: <20210723075858.376378-5-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 15:54:11 +0200
Message-ID: <CACRpkdZm9C23aHTWs8DNX1RChSB4A-X0PoyW5wnH2XyQQeviag@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] leds: pca955x: Use pinctrl to map GPIOs to pins
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The leds-pca955x driver currently assumes that the GPIO numberspace and
> the pin numberspace are the same. This quickly falls apart with a
> devicetree binding such as the following:
(...)

Honestly I do not understand this patch. It seems to implement a pin
controller and using it in nonstandard ways.

If something implements the pin controller driver API it should be
used as such IMO, externally. This seems to be using it do relay
calls to itself which seems complicated, just invent something
locally in the driver in that case? No need to use pin control?

Can you explain why this LED driver needs to implement a pin
controller?

Yours,
Linus Walleij
