Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5947F1270B1
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2019 23:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfLSWbQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 17:31:16 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:42924 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfLSWbP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 17:31:15 -0500
Received: by mail-oi1-f173.google.com with SMTP id 18so3114224oin.9;
        Thu, 19 Dec 2019 14:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=D6/Lnp9SQxWtLanrpfRv/1y5LG5SQwcq+M2dD1VqhCc=;
        b=UIlkLJTzkB58yH9MjpyIv+ZigyxIADyYVhnN/t5STXZFfSHiNrh42+UhXN1DSGaIdZ
         bSbTGoiM7AecdCxSoax5xHmn81NqzzXWbsy37SV/XUov+1B6Qaz4PvdX1z4HfKO+fQgl
         OXzQbS67SSyndWNeRyp1blks1EHuiGrn+tn9hezCZvTKhP2oCY/4dUvQFOlSrQrbcIZs
         bgxLnvHeS8UxWqo7AycBKEGMGdPsrO54peWdRB/kCB3r1hIIVMKY0blcrwGuZKIDh1K1
         yXP1uKDNcbvMNkQWFWa9sGM5bZl9vBsbjQL3+zC+7SB+YbB31frqC0VrIeQvj6gv54YY
         qUQQ==
X-Gm-Message-State: APjAAAWC3SQnXsusLrXgSDk8WConFShY2VxQN2udRLpK4HVu2d4rz/ra
        hNRZmAEGnidr3qgNJrioUA==
X-Google-Smtp-Source: APXvYqxP+AsL2ClzQz1/tTdWWz61H8T7A5vOVoIHbEWTGgA7cl+qlj/GpeLj2PAWGr+P+OTYVDHkww==
X-Received: by 2002:aca:cf50:: with SMTP id f77mr3288551oig.60.1576794674782;
        Thu, 19 Dec 2019 14:31:14 -0800 (PST)
Received: from localhost (ip-184-205-0-249.ftwttx.spcsdns.net. [184.205.0.249])
        by smtp.gmail.com with ESMTPSA id n22sm2636449otj.36.2019.12.19.14.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 14:31:14 -0800 (PST)
Date:   Thu, 19 Dec 2019 16:31:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        zypeng@titanmec.com, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 05/25] dt-bindings: vendor-prefixes: Add Titan Micro
 Electronics
Message-ID: <20191219223108.GA25174@bogus>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-6-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212033952.5967-6-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Dec 2019 04:39:32 +0100, =?UTF-8?q?Andreas=20F=C3=A4rber?= wrote:
> Assign vendor prefix "titanmec", matching their domain name.
> 
> Cc: zypeng@titanmec.com
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
