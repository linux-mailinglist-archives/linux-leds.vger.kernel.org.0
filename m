Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625D340120B
	for <lists+linux-leds@lfdr.de>; Mon,  6 Sep 2021 01:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhIEXOL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 19:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhIEXOL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Sep 2021 19:14:11 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32A1C061575;
        Sun,  5 Sep 2021 16:13:07 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so6598053otf.2;
        Sun, 05 Sep 2021 16:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9V7Q8GI/TqQmdot0u+T3jPQv2cYpKk0ofFHeNMLopg8=;
        b=eAobxRbWcGWVPMl1ri9Ahhvz/St326GOPO4m8WMcHyO6AKnVcE7rIvrcINaqcPvmxH
         Qn0/NxPEZR45/FJ4FkYs4lMsKabjGJWIkTtazotOe9C2tOOPhf6cJiIKgXzW2D0lICaZ
         7p8M261F4bVbGTI4uSRhrHah358wndsYI/fOeF81wwMjUSe+xLXWINR2WK39emMmLiGb
         TSu7A7Q7e5StrFNwY8RURR14tH0cK2FV+krrk5BQ7Yq0ZhPGdCU738d4ImFXzkEeMoJX
         PHzauFoMzqjR+qxmPzObLKJLXkyLE1N69EeW4IyPq+slXrErqFvt7mSivaSPLxNn5/Ug
         TvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9V7Q8GI/TqQmdot0u+T3jPQv2cYpKk0ofFHeNMLopg8=;
        b=GWX2v9sCkHZfViKW+Fk+huGOPMg1DL6RIhEP6BaA15g+fbtGP4GKB3venB+hBVuwvR
         A4mnrDyUN0L93v7EzdPHmy8pYHEuSF8Aya3RxRsySMiOfXTYT6xrIHfE94Hko3B0R7G5
         xj/js1SgkUePqjJrofMm1AiLqHC8EzF1nZEGxishxoGJMPbKp0T6ZUe4gs9VySyj4S91
         uVNdAr1+NVUpXvXIY0sNTbfmuB5ZSnS/FfSbHLAOLCQ+Q5T2l2DgA2BKxE+cwHnhs+Bw
         5gaYmPikEiy5kh8Zex+W+GDng16iLHBcozDEfjEVW0qQ+QlTLOrwVN139xamRRQQD2k2
         0LdQ==
X-Gm-Message-State: AOAM530t6T/NIFkcgQO3/YlEXMj82SJP/js91CA147uiNytanVRMWwoK
        35s+g1fDSls9qopdRYzsxU0=
X-Google-Smtp-Source: ABdhPJxDr2QyXamxFr4GsQXBb03lz58moFk4nVQzgByKbogKvJvVZ5zcfMxYnDKa2I21GQHiwbEH1Q==
X-Received: by 2002:a9d:719b:: with SMTP id o27mr8741297otj.257.1630883586482;
        Sun, 05 Sep 2021 16:13:06 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id h3sm1413512otu.7.2021.09.05.16.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 16:13:06 -0700 (PDT)
Subject: Re: [PATCH 01/18] docs: Add block device (blkdev) LED trigger
 documentation
To:     Pavel Machek <pavel@ucw.cz>
Cc:     axboe@kernel.dk, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-2-arequipeno@gmail.com> <20210904062938.GA25286@amd>
 <63839834-d383-d224-8bbd-d37c6803a68f@gmail.com> <20210905184250.GA9022@amd>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <4a295f62-b61a-81ae-72c5-43e15408c2a4@gmail.com>
Date:   Sun, 5 Sep 2021 18:13:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905184250.GA9022@amd>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/5/21 1:42 PM, Pavel Machek wrote:
>> If using symlink()/unlink() isn't an option, do you have a suggestion
>> for a less seriously strange interface?
> 
> Let us explore this possibility, first.

It doesn't look like either sysfs or configfs is set up to react to
symlink()/unlink() calls so, I don't think it's possible to implement
that interface.

I don't personally know of any current sysfs API that manages a set of
things like this, so I don't have anything on which to model an
interface right now.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
