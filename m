Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166A721C579
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2020 19:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgGKRT1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 11 Jul 2020 13:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgGKRT1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 11 Jul 2020 13:19:27 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B573C08C5DD;
        Sat, 11 Jul 2020 10:19:26 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o2so8957055wmh.2;
        Sat, 11 Jul 2020 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BAY2/0J+ZmHyiIP5qBIYgvkyqh416isH8/DQ5Y+/lR4=;
        b=Jn4vqjOe1vlXGpmpFkxEq/lsZBxq7vqbdHx5DuZWQWam7mPTJ0xoQ86fvLGKDTocWQ
         4/mLwdfdrvdp6Enxgp4B7N4r2blG/USWai0/Tl+1pYAwzq2eH4j037KlyyT6v/Tmd26/
         OFapOiV2ZPCpEPo1tfTUb6/s5fG69nP0bJrzvz5EfvUfjg2KeOpCKlzen4SBSK/++HR9
         jaVJ2f/E7CWtGlf4f6rECZzxJazF2Xm91y4APFaxtFWu9V9Y95nnlTW29Vvw5U+15Icf
         ql8XCGDXWP6Gf0AXNgeYV3VmHyyDif/tO4yipq0/Y0eWz+7ZlOqrR2XHjWgIx3xp8y9F
         pZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BAY2/0J+ZmHyiIP5qBIYgvkyqh416isH8/DQ5Y+/lR4=;
        b=irEOOI9UmeYvihN/IGrftf8aSqqDnbVLYwXXm0TkSYgrAz6a9a8S7RtjcmPr6ac9Dx
         8IOml6RJ2HhCDrnStnAPt6ZTJie/3Kib1gU8RVvTWVZTIArK1x2NqxkLyE0lFdb9SgPv
         9TEPGrN3rBPvp3CY6TrrKJtBSzLMd53AvO2EupPgbhna7vpPyc3dlkTN2ALGTFkxJf+G
         vnO1zqPvg0zGtONr6LMl4NV31mZ232CRmM1beUYZf3v5w9eSHEc8nyFPOw/xyWIvJDn+
         oFltrpD/Ed64rfNpdM7wgg+eVnq3wn9v0LuH/p5fqYZh8DSGztVttY2/IPxw8JzYafW3
         0n0w==
X-Gm-Message-State: AOAM530dGwPINP7d1U1KIXEZt+qm/fgaE4L5DyoyFrJ+UCRJ89/gpyPc
        q4AvEf/WUkN62qoQbQn9W18=
X-Google-Smtp-Source: ABdhPJxv2OIE3YrK4OHjS2Mx+Yn4v1VlZsR6jW8FSXzwoxPCICSLQIr/RL1LUYfXVZufqX1/z7SL3w==
X-Received: by 2002:a05:600c:21ca:: with SMTP id x10mr10638365wmj.63.1594487965310;
        Sat, 11 Jul 2020 10:19:25 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e1bd:5ced:59bb:4d37? ([2a01:110f:b59:fd00:e1bd:5ced:59bb:4d37])
        by smtp.gmail.com with ESMTPSA id o29sm16760012wra.5.2020.07.11.10.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2020 10:19:24 -0700 (PDT)
Subject: Re: [PATCH v29 13/16] leds: lp5523: Update the lp5523 code to add
 multicolor brightness function
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     robh@kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-14-dmurphy@ti.com> <20200711155749.GB22715@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c9e20136-7226-2feb-b017-0a0742867f93@gmail.com>
Date:   Sat, 11 Jul 2020 19:19:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200711155749.GB22715@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/11/20 5:57 PM, Pavel Machek wrote:
> Hi!
> 
>> Add the multicolor brightness call back to support the multicolor
>> framework.  This call back allows setting  brightness on grouped channels
> 
> Extra space before "brightness".

And before "This".

-- 
Best regards,
Jacek Anaszewski
