Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EFC4270F7
	for <lists+linux-leds@lfdr.de>; Fri,  8 Oct 2021 20:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhJHSwr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 8 Oct 2021 14:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbhJHSwp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Oct 2021 14:52:45 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984B7C061570;
        Fri,  8 Oct 2021 11:50:49 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id u20-20020a9d7214000000b0054e170300adso12728737otj.13;
        Fri, 08 Oct 2021 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=zo9oTEkHycwlnffJKnQsy+XPbfEll/dsVZiLTVHmerU=;
        b=PmTUzWEyyPkTeXbAbnd+573T2L+HgyR2DrWZz64fbngFflxhLDddp019T7m/Rk+SCk
         engPIG1tukXL8bjnXzZYEa4Nzr1pKbX7J1AhmQUGgTh97HFAxvhqStTAVwijORmMBQj3
         DRTk7sr2LnHXFtpN3QhJyUwr68PayUygorL/U7eqWdsEPKAP0Qkv6AqNsLMz5vmfYkWT
         PuOrnHZffxgm3WieW3Gh/q2RdB5+3p0it6Obp0l1jtabqH0ktxnxQgNo/jI51mQb7V/6
         pa6aMsW8PdaPq1AYhWbKoRr3ikTgT3W7bY7qqT185+ybbCOvxLAN0CdBz/gOFPDXmjK7
         eN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=zo9oTEkHycwlnffJKnQsy+XPbfEll/dsVZiLTVHmerU=;
        b=XUFQjjKyseNb6S784jiJmmB/VX0Id6O+gu7c8ouWaus/axvsiDUuSgmGr6wRK36KQ3
         +vx8GkAIcIdqpS1UAYERgXEOHQvVJ/JyfvFWz/pz6u7MBiSyWnW44LiSQNa6MrIC7vS5
         Rhoa/LywQR0VLVXysJ6SGF8wM2eD9m42sZdk/xuuNZWpMStdrYXVrqkN9fxgYK2KpiQ/
         XfO0wrimc8ItaX0yzjOkubkCqUP3kbfocnFxqdS1qKXWpLl9xYALxTbq/24XzqZZxQxy
         MqUz1TSzOhPLdUySd4GMmXQR8hgO8LH36OleuAN3i9lfb8VilxNUJ3DJ3BZtded6gSk9
         0ikw==
X-Gm-Message-State: AOAM5317kuNHupZb3ZnTig7W7sQSQxGpaePOiMfzCJ6WmSqz3g5lHfsg
        d3E605tutukYDkNktLxYLOU=
X-Google-Smtp-Source: ABdhPJxHofFUg4nRDoH9Tq8QrtiS5OnbsWlqsYIXwlXeTgAYP9ObrahT8mubLFF2d+J+o0cg/brSMg==
X-Received: by 2002:a9d:a4d:: with SMTP id 71mr10336353otg.249.1633719048965;
        Fri, 08 Oct 2021 11:50:48 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 33sm32943otm.28.2021.10.08.11.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 11:50:48 -0700 (PDT)
Message-ID: <95d291f6-e1e8-76b5-84b5-1b9cd0876585@gmail.com>
Date:   Fri, 8 Oct 2021 13:50:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 2/2] leds: trigger: Add block device LED trigger
Content-Language: en-US
From:   Ian Pilcher <arequipeno@gmail.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, kabel@kernel.org, hch@infradead.org
References: <20211008181224.185829-1-arequipeno@gmail.com>
 <20211008181224.185829-3-arequipeno@gmail.com>
In-Reply-To: <20211008181224.185829-3-arequipeno@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/8/21 13:12, Ian Pilcher wrote:
> +	led->last_checked = get_jiffies_64();

This is incorrect.  I decided against using 64-bit jiffies on 32-bit
platforms.  :-(

v7 coming soon.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
