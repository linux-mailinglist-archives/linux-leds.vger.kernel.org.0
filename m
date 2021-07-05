Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A513BC365
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jul 2021 22:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhGEUhJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Jul 2021 16:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhGEUhI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Jul 2021 16:37:08 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CC3C061760
        for <linux-leds@vger.kernel.org>; Mon,  5 Jul 2021 13:34:30 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id b14-20020a1c1b0e0000b02901fc3a62af78so237294wmb.3
        for <linux-leds@vger.kernel.org>; Mon, 05 Jul 2021 13:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+6XOS/q6tNEotrOvsPcxWCl8XfwpWQ06BCfh8JP8qiQ=;
        b=OZWxOeaAZD36E5pXxxm6Y4Pq5dMm4vQyq3XYuN9VI+P4x03ANViKySjMaKux1H2p6/
         /tj52CZTWP9a5s2wQs25SXkMOxHxQIYmWsXj8WSn0ypX+TOosipox/szAKuNi6li+tzU
         VzBRRMSufdqzX+6b9avxM+vicqNSSkIe7I06jsY4XW24zwscdbDTvHoqK0sYi794z91G
         uLDsgYv8M8MahuMr80pccB74y1j+tHwc/gFIHQNf2uF+LRrj8BGGJQKxyOG+L2+ixhza
         UCS+I5ZF7QjJpArK8dN1aqXjlJ2Q758b4wDV7qCHuaLXq7FpM7hbMFfaz+VrMcm1XaaI
         SyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+6XOS/q6tNEotrOvsPcxWCl8XfwpWQ06BCfh8JP8qiQ=;
        b=Qfv//Pmsa57bdP4SXL8Rz5ndfa3K3MTlKsbfAAbS8CTyyxTz9KcpLncBLt2LDbu26Q
         hkkQJ3vnZrRYSJdj5Ygctu/LfNyWTGuIX5+OT6bR4Aus/VHIkbbS++AE/zwQPjknZEsh
         79ZInTpH2fTkz0l/hjE6MDzzUjPPd+AgDZwK47ZajkMyz3mox/2ryKfnf68FqIRLLG8D
         zhuLsl4gtLdTxhSDUx3S7YKQ5sjujvNtlKmcGBFYb8FXikPOjxXXL5w3x935bYXLLHzm
         NVpfztQ6+0d2UtGYA2/HLazhCh8ovy+3tAEl/tZwrbV7gXjbGSatCPK3X9P/nzpZkK+9
         4G+w==
X-Gm-Message-State: AOAM531qV66haENXOUb7ZiNWuhVSnkYutAhpGc4hYpijB7z7QaTKzs2E
        T0viNYTDOxi7OAgrISJE1k5YlA==
X-Google-Smtp-Source: ABdhPJwc1nbFhcPHi0y+6jFNObg+WQXsxOkhGb003NiPPJjXll80h+S/4WyNzRH508DiBDetQKm3xA==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr835095wmb.158.1625517269112;
        Mon, 05 Jul 2021 13:34:29 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id c16sm14208870wru.24.2021.07.05.13.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 13:34:28 -0700 (PDT)
Date:   Mon, 5 Jul 2021 22:34:23 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     pavel@ucw.cz, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: remove ide-disk trigger
Message-ID: <YONsz9dG08YZOLg6@Red>
References: <20210628191719.2823947-1-clabbe@baylibre.com>
 <1153e311-e0cf-d869-e3f8-b679eb2e60de@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1153e311-e0cf-d869-e3f8-b679eb2e60de@metux.net>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Le Tue, Jun 29, 2021 at 12:47:27PM +0200, Enrico Weigelt, metux IT consult a écrit :
> On 28.06.21 21:17, Corentin Labbe wrote:
> 
> > diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/ledtrig-disk.c
> > index 0741910785bb..38a5c21c0466 100644
> > --- a/drivers/leds/trigger/ledtrig-disk.c
> > +++ b/drivers/leds/trigger/ledtrig-disk.c
> > @@ -40,7 +40,6 @@ static int __init ledtrig_disk_init(void)
> >   	led_trigger_register_simple("disk-activity", &ledtrig_disk);
> >   	led_trigger_register_simple("disk-read", &ledtrig_disk_read);
> >   	led_trigger_register_simple("disk-write", &ledtrig_disk_write);
> > -	led_trigger_register_simple("ide-disk", &ledtrig_ide);
> >   
> >   	return 0;
> >   }
> 
> Shouldn't this line also be removed ?
> 
>    DEFINE_LED_TRIGGER(ledtrig_ide);
> 

Yes, I will send a v2.
Thanks
