Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF023127135
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2019 00:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfLSXFg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 18:05:36 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:46750 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbfLSXFg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 18:05:36 -0500
Received: by mail-ot1-f41.google.com with SMTP id c22so9217026otj.13;
        Thu, 19 Dec 2019 15:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZCQ1Dwncfy85QJcD+8lI4SZ2RUHk9BCcr6X6gMTs3cQ=;
        b=iRhn3XGZb0zpdK2J5UxKaTO4klpLJqDKid7fz/kZUZgkuxbwB+tyKKELtujBD24Swy
         tJi9SkF3SdzPRp2LnODns1ldXmTzEI25+e61mEE4fHhldWNOPowy1oOk7uC6B7Mx6nrm
         TO0vxJf7phcR++hMBBiVcXAcZJVpdCddDGwHxIe6DsgrskO/biaVGXVKxtmwhut0KU7F
         tRBJb94gdBVBunJjZvHgBzvDfqbPpv0EO7uodO0FYeniu2RJ2TzkKIc3Isg6oE6kLDLl
         DHtJnyJWIVtrpvdaPSJx+7St0/PbjJyelUnQlWg9HolK3GU6pnUQOQGxKjkWMyFpdexq
         /5KQ==
X-Gm-Message-State: APjAAAUAQK/G+MzjXGkaWopKQOzN/D9jAhHsQIJTPNpepWx7i3e8kr3u
        aLmo5vttERU8HElMOO5RKQ==
X-Google-Smtp-Source: APXvYqxGFILFdnmpYvTlQh/DQsjlI6cjEEvTx4e/kHMSohnyw/QBA+Cv+Bb7YZtOB1stiIlIBzxl4A==
X-Received: by 2002:a05:6830:160c:: with SMTP id g12mr11177327otr.82.1576796734931;
        Thu, 19 Dec 2019 15:05:34 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id q25sm2662018otf.45.2019.12.19.15.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:05:34 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:05:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [RFC 15/25] dt-bindings: vendor-prefixes: Add Fude
 Microelectronics
Message-ID: <20191219230532.GA6057@bogus>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-16-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212033952.5967-16-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Dec 2019 04:39:42 +0100, =?UTF-8?q?Andreas=20F=C3=A4rber?= wrote:
> Assign vendor prefix "szfdwdz", based on their domain name.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
