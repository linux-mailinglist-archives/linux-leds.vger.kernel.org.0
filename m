Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F9B3DA8AA
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 18:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhG2QQu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 12:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhG2QQt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jul 2021 12:16:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56EBC061765;
        Thu, 29 Jul 2021 09:16:45 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so6457567oti.0;
        Thu, 29 Jul 2021 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PPsPSzxLvC5DRd9zmh1nElMNXIvh5LMndC48uND3l50=;
        b=PmSYYquQ4lHR2+pqeT/8VPy5ihnhrNFt3FqzGWjTjhU1sro3g6RMUeQrSIWqT1QEtp
         URzjftDFv6IfB2eI+BBsVClIuTcki8S67ayy5TllJM0vg07XnEeVPwu2R9kzClweIFYm
         szNGR0q/RXcyvV5Ou7Qn2nCZ8i6umk4giqcO4u6MY6EbwwgKPgrqr1NY3S5u+pLiosOS
         DeaE7zOxaX2zCRli4e0jF599XbjK9tHAU7FWYO8a+b1H0ciVHkZ8t4/maaF539BvVd8A
         5lTyY3uBuozXXsdeHWOhK0V+S+qeIyQNCN9scMCJfN39XtqxjfEJpw6iM4rV0T+eSlvn
         DVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PPsPSzxLvC5DRd9zmh1nElMNXIvh5LMndC48uND3l50=;
        b=O4W3VuvJcUnaArfhZizbh7bOvRbVJDspK67Rntuo1ui/h55zL6Bjp07TH7BGP1XYvs
         xgA/qb2EBZfkjicrPyBUV0UB1jfaTAGoUIdXp73bWDu4X7jXHYuatyEVU/iv7y/FUYIK
         ycdUL6cHM2IczqwZxmtd3DSuOMJlMiREPrsil2SDuuQ9zbhAoHkbzQpecIQ4cgIRfbsO
         LU+tlKWK5YCEJkVaLc/MsWn2NDFNeNdXPiF0KsKOrw/sZaEu+ouO74pmsFkCwyNEfk+e
         7I0tv4yxe03W7RCtH+z/qjBYZ9CorYEVKBGXLzLf8hB3Jaqj0WwInMIcEZLyzuxFA/2f
         Jx1A==
X-Gm-Message-State: AOAM5313FJvhj4H8u/JrBPkTjdRxO+f2DXUzDOi16XB9pRE+a+9QzW6Y
        nHqzoI3iUEX77pFBwu8VyVhJPZgnQrf3lZiM
X-Google-Smtp-Source: ABdhPJwtNfvn1W6zUgsLjM03xBPfHPlPNAtz1JY9XUWi5b6kD0LOIHYXINce1NRWxdbbbRoiQUqo/Q==
X-Received: by 2002:a9d:6c8e:: with SMTP id c14mr4210242otr.5.1627575405140;
        Thu, 29 Jul 2021 09:16:45 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r5sm584841oti.5.2021.07.29.09.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 09:16:44 -0700 (PDT)
Subject: Re: [RFC PATCH 3/8] block: Add kernel APIs to create & delete block
 device LED triggers
To:     =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729015344.3366750-4-arequipeno@gmail.com>
 <110419.1627530334@turing-police>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <36b97f0a-b435-24fa-df2e-f507a4971bd6@gmail.com>
Date:   Thu, 29 Jul 2021 11:16:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <110419.1627530334@turing-police>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/28/21 10:45 PM, Valdis Klētnieks wrote:
> Is pr_warn() the right level for this stuff? I'd think this sort of pilot error should
> be pr_info() or even pr_debug(), if mentioned at all.  pr_warn() would be for
> something like an unexpected situation like trying to blink an LED but failing.
> Simple syntax errors should probably just toss a -EINVAL and return.

Fair point.  I'll change it to pr_info().  I'm reluctant to completely
"swallow" the error message, as I've been on the other side as a system
administrator trying to guess at the reason for an error code.

> (Among other things, this allows a userspace script to spam the
> log by simply repeatedly trying to create the same entry)

Only root, and they've got plenty of ways to do that.

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
