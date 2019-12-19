Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 433C812713A
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2019 00:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfLSXG2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 18:06:28 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:39059 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfLSXG2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 18:06:28 -0500
Received: by mail-oi1-f176.google.com with SMTP id a67so3867436oib.6;
        Thu, 19 Dec 2019 15:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1yZH8V3CdOmQjuS73Msz5ZyhW6PkWuP2FDRhP7F/Hfk=;
        b=M22OEG23pCc0+BccflyxWyi2vEZ2XxqgB0Vk/dE61KnVg4elHxlmdBIshGCFjjEh91
         wBGGfVSWTkQWIIStfYfX/AoeaEx6ez3xkfbSKKlpSesKSfJMlmhPDVcHsH9Q1//kZlcA
         Oin+71n/nqOv0RkbnkyKjLLAKlzBw4W7ql8f58nki+6pwq9gVoK3P3dF6sI0/40Kn6vt
         zDZD+N8kYMZTu4vHREkbsXjvkzt7WoipAp+gVK+PsWcfB9fTC0ZSTX8VN7z6WeuWRVEp
         c8cqMlCrPOjXPPSZ1jipCRuOvu7WEWckwX6kuKZFRnhOkEiheNZWnNwtaIgUSyiyG21d
         Ln+g==
X-Gm-Message-State: APjAAAUMIwfWKSwCeK0LEXqWUnTFsJFxLye/ErbpHXBhTfgWvvXVVgjh
        gfHgtvpDMdqfIcKCZguLEA==
X-Google-Smtp-Source: APXvYqwSIAXcQUDg2gX98PBOc+oiM4Gom1haSyaRLuef1KLWXsxmd15JOd90nbJsIeaJwD3TBVTLrQ==
X-Received: by 2002:aca:f445:: with SMTP id s66mr3072290oih.95.1576796787716;
        Thu, 19 Dec 2019 15:06:27 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id m68sm2497501oig.50.2019.12.19.15.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:06:27 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:06:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [RFC 16/25] dt-bindings: leds: tm1628: Add Fude Microelectronics
 AiP1618
Message-ID: <20191219230625.GA7332@bogus>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-17-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212033952.5967-17-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Dec 2019 04:39:43 +0100, =?UTF-8?q?Andreas=20F=C3=A4rber?= wrote:
> Define a compatible string for AiP1618 chipset.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  @Rob: This one would conditionally need to further restrict reg ranges then.
>  
>  Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
