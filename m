Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B9324C2F4
	for <lists+linux-leds@lfdr.de>; Thu, 20 Aug 2020 18:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgHTQI3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Aug 2020 12:08:29 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33771 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729256AbgHTQI2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Aug 2020 12:08:28 -0400
Received: by mail-wm1-f66.google.com with SMTP id f18so4080176wmc.0;
        Thu, 20 Aug 2020 09:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wuRU/uq8S53phIeWuIyFmBKk+PYK0W37wHIS7Hlciek=;
        b=YlYXW6lFe8zpxR07x6CB799xf28bj0o9IlKFSNq/Q6UfbS5YpBlCK0vaQrXEddwoXc
         JqeqzUUi8lCBq0V7WWLp8QrlZFSxsIKSEMN6Cfz5/NpxXmL7nbjilaxq46FeBT6yua6u
         5IUd5x/UwvPURqXi8SuxM9rcsY+UUaSGxEHug2ttfYnmj6H6RKqcET6yX00dOIV/I3AS
         FAjUTuf8TR60wwOT9KmJdt4aQbKdhuG2vhoh2trsqR6ETLUzTF1bQG81WKE7D06FbUD7
         olWdF4Jllw2bo5MoHUXvfWV3o+eGvndc4hUD8Gk3lv4bMfdfgMKmlN09RSrLfRr96THG
         7bdA==
X-Gm-Message-State: AOAM531edItLLJqQOE1w3BEzP3rRZJM0RZRiyi55Zl2p53xZnQZM2siq
        8+cJ8TC9+VLNCCmQeoFK/b4=
X-Google-Smtp-Source: ABdhPJxoa/dTHTt5Vl/8wlFD8PPP1Dm01I/o1aTvx5QxWoQ4fHjzcI5g0ZadKHebFBvRuvW9rUV/sQ==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr3915573wmh.80.1597939706102;
        Thu, 20 Aug 2020 09:08:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id c10sm5038030wrn.24.2020.08.20.09.08.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 09:08:18 -0700 (PDT)
Date:   Thu, 20 Aug 2020 18:08:16 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: s3c24xx: Remove unused machine header include
Message-ID: <20200820160816.GB21395@kozik-lap>
References: <20200803091936.24984-1-krzk@kernel.org>
 <20200805215730.h6434lief5drnnu2@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200805215730.h6434lief5drnnu2@duo.ucw.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Aug 05, 2020 at 11:57:30PM +0200, Pavel Machek wrote:
> On Mon 2020-08-03 11:19:36, Krzysztof Kozlowski wrote:
> > The driver includes machine header for GPIO registers but actually does
> > not use them.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Thanks, applied.

Hi Pavel,

I am confused because I had impression this will go into v5.9-rc1 but
it's not there.  My further S3C cleanup depends on it [1] and now
applying of the patches stuck in the middle.

I could take the patch through samsung-soc along with the rest of the
series or pull from stable tag (but tag with only that patch...).

Best regards,
Krzysztof

