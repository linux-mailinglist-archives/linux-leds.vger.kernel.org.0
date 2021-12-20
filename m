Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99E647B1BD
	for <lists+linux-leds@lfdr.de>; Mon, 20 Dec 2021 18:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhLTRBA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Dec 2021 12:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhLTRBA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Dec 2021 12:01:00 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9ECC061574
        for <linux-leds@vger.kernel.org>; Mon, 20 Dec 2021 09:01:00 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id t23so16715323oiw.3
        for <linux-leds@vger.kernel.org>; Mon, 20 Dec 2021 09:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :references:to:cc:from:in-reply-to:content-transfer-encoding;
        bh=JyMUtWQ8ssjkLp2jnrtjK/vkLZXwovOV3jMjbhrs8Q0=;
        b=mjJOz1RpLNzfppkja+iXawlheH6MID1Nlw6fbZ9FTgRaznFHTi8s9V5QwTX9V4IgaZ
         P3VqI/fyP5IIcvRvG1Ymwg5AhLo0qDTgf6KU9LWs0yx0WtL2yCTURcIY1VgzJ997dKlD
         ljQrrdsDQlUyzJgQvYE5kkO+vWE+9gURko/yASYghT1XJGKHLP2KAJTCDUwwhpXdOIcE
         +l5l1jDxSOVvlqfSddotYsz5IDwNtlh1YR2sfET4QKh8cmN21RQLbYXbD8nU4/FwdjzX
         Iw1aGlpdOFIDaSGwY3dDAQ6oncfPEE83mIcBLspgmx4TBdfM/xCsDCGnR78qn3gsfiys
         lIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:references:to:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=JyMUtWQ8ssjkLp2jnrtjK/vkLZXwovOV3jMjbhrs8Q0=;
        b=EhLQg/3eXg/wovOMTB/YPkuVW7ZvVLTErhoEY6/5s0zQK3ijjlllAqh77z3P7NZzL/
         p/POaTXgAtm5tPfXIXdkoaGXGt2Md3Gp1SQWZIx4+VBw8iXF55Hxmmucu96/jMARuy2x
         au3XJdljAeE+hvF5eQwnsEGFURu/Nbq8cRPDMrTY34o18s8ENjSuthTAaeS25Ok8Jxvr
         P0Gr9te4Aj3RYzGhXv6y40WCh7dOtX7HVifFh1hEutJ075BuJXREBf8itkDlNxaNTFdt
         KYffCX2Iumb5hwQX9J1kCJeOMB7mCjR6PG/czCCvnG7JF15g2pseQB8/zU8uykajziLO
         /GZg==
X-Gm-Message-State: AOAM532RFRk1ZDU/4NTytnCEtdUElTxe9s6E6fCE2CBi68pVfklNlhW5
        hTBWxgbZVhNzTPBqmwYspqqdd0YTw8LiJw==
X-Google-Smtp-Source: ABdhPJwOXzb4B+Kz8wqvb6QGxWoy1QBfR5jFo19l7gy7jHSuo38ZBlJcIGVGkpFHzlY8z/V0S68JBA==
X-Received: by 2002:a05:6808:23d6:: with SMTP id bq22mr1977657oib.71.1640019658114;
        Mon, 20 Dec 2021 09:00:58 -0800 (PST)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id j187sm3531524oih.5.2021.12.20.09.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 09:00:57 -0800 (PST)
Message-ID: <f9751e13-837b-042f-7541-b542a84510b6@gmail.com>
Date:   Mon, 20 Dec 2021 11:00:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [bug report] leds: ns2: Remove work queue
Content-Language: en-US
References: <20211210135249.GA16777@kili> <20211215203955.GG28336@duo.ucw.cz>
 <20211215220441.2d83299a@thinkpad>
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org
From:   Ian Pilcher <arequipeno@gmail.com>
In-Reply-To: <20211215220441.2d83299a@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 12/15/21 15:04, Marek Behún wrote:
> The last time we discussed this, Simon said that he is willing to
> convert once we have trigger offloading API. But we will also need
> blkdev trigger. Time to review Ian Pilcher's last attempt at blkdev?
>    [RESEND PATCH v8 0/2] Introduce block device LED trigger
>    https://lore.kernel.org/linux-leds/20211119212733.286427-1-arequipeno@gmail.com/

I support this.  ;-)

Let me know if you'd like me to resend, have any questions, etc.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
