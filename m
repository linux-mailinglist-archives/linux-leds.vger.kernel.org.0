Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8445612712E
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2019 00:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfLSXEu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 18:04:50 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:36998 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSXEt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 18:04:49 -0500
Received: by mail-ot1-f44.google.com with SMTP id k14so9239625otn.4;
        Thu, 19 Dec 2019 15:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Uy6XZuGxPiXexyKWxx2j42oDrSDjvBmXtbIAxp3wyp0=;
        b=TjdaqlgDy4rYXopmF3fiepgKTQzihU0MAx1f91loRUWDAuBc3L9cjcW+QZVLGIA1kU
         eU3yoDPeCDfNoy4r2NAwHlM3pL/h+6dyLvT0W/0c/Zi+kVuEM0+3t2S5nx4Egs7cn6hG
         cK53BEpAEKtolUK40YnENXQiruOkz1xrWPWfiYvq4Jx859cnBSxUg7EWSobndRlaNKSl
         c5143ylLl24A7zN6zvVaMY3u0Xq5HylelVPXQ9638BAjHmQMuHHJjNGZuanFoB4KwN/g
         g8mKdRAVhVYFoYr8YIlsjusa7+rDgJmhdXa8NwLzNphrs820bwf0ztrtUyQ/hZo40j39
         l39Q==
X-Gm-Message-State: APjAAAWiuG5SzioK8OyedDXmj5K7tFVgXyw0hjgIsX7MkEQky4vhZCgG
        MgHM0OgqjFMk7WR0Whaz8g==
X-Google-Smtp-Source: APXvYqzThTv/MWit+dLYB2MQbaWXf4JGxuC+UR5rIDEFynaHbDFz7eUpnZID3Q7FtHacHRMEhcURdQ==
X-Received: by 2002:a05:6830:159a:: with SMTP id i26mr11654069otr.3.1576796687351;
        Thu, 19 Dec 2019 15:04:47 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id 97sm2672507otx.29.2019.12.19.15.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:04:46 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:04:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        sales@fdhisi.com, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 10/25] dt-bindings: vendor-prefixes: Add Fuda Hisi
 Microelectronics
Message-ID: <20191219230444.GA4752@bogus>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-11-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212033952.5967-11-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Dec 2019 04:39:37 +0100, =?UTF-8?q?Andreas=20F=C3=A4rber?= wrote:
> Assign vendor prefix "fdhisi", based on their domain name.
> 
> Cc: sales@fdhisi.com
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
