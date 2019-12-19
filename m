Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1D5A1270A5
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2019 23:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfLSW0p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 17:26:45 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:44952 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSW0p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 17:26:45 -0500
Received: by mail-oi1-f178.google.com with SMTP id d62so3791933oia.11;
        Thu, 19 Dec 2019 14:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jqq8LY7quOQ87/Gczi2Dv0ztqAoB2GKBCxLo/uj7ep8=;
        b=kZ0IygETcCwTYOsNifAIcW3AO7aCPVHEYihCBgKr1/eCXjv3zcb94wTe+4FYBsIf5w
         Nw3kjFNqzkUd5Dl0vaWmCozBk8oakX7Gt0/NbLahBigMdTgtC+AK6ZZ5T7Wd3UP/kWUn
         oEgSTv7RELBFVl/H5K2Q3wq5tVZnUZ9OFwlUhRjE/FSBrstO1AkhGhHaTck7ZYXnI9My
         glwZ0QjjaDmKgxX6TLxDgIxVXyfyBJK1EJCFEftNNNET+uz7epomJexbZqcBxQ8Dj6jn
         jUOqo4TRe3im+2TDXZWECwo39NDmRNZxe8El8deBxxcZgW4+OhNGv2N4oJQPyzUEHXed
         7RLA==
X-Gm-Message-State: APjAAAWzLItJxatvKkSvfjYVbtuC23MI5W8wNccKPrO1TURPEkd3Ay0M
        G57SNfCu/9FdkbB1oBQ0E1RoXQiGSA==
X-Google-Smtp-Source: APXvYqxbPZlq94XPJTqNa3s92n082GMAw6K5NiT7FKfpiJdag5EtNAmLYlGnaIi9O1IqvCUv7ZfApg==
X-Received: by 2002:aca:1e11:: with SMTP id m17mr3286383oic.167.1576794404525;
        Thu, 19 Dec 2019 14:26:44 -0800 (PST)
Received: from localhost (ip-184-205-0-249.ftwttx.spcsdns.net. [184.205.0.249])
        by smtp.gmail.com with ESMTPSA id x19sm2528984otk.42.2019.12.19.14.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 14:26:43 -0800 (PST)
Date:   Thu, 19 Dec 2019 16:26:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [RFC 01/25] dt-bindings: vendor-prefixes: Add Xnano
Message-ID: <20191219222445.GA16503@bogus>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-2-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212033952.5967-2-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Dec 2019 04:39:28 +0100, =?UTF-8?q?Andreas=20F=C3=A4rber?= wrote:
> Xnano is a Chinese TV box brand, but not much more is publicly known.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
