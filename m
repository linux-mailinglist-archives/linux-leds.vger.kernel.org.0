Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583D41B1145
	for <lists+linux-leds@lfdr.de>; Mon, 20 Apr 2020 18:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgDTQR3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Apr 2020 12:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728209AbgDTQR0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 20 Apr 2020 12:17:26 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4639C061A0C
        for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2020 09:17:24 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id b11so12907743wrs.6
        for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2020 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lPlsXqCGHYagVYmxec3j/xxnK3oND8ckDanm4J5g6+s=;
        b=Bc3VkmccqsOZmy8SzqwTXHtw4ju1n3q+E8tqpZL08g24yfYOc29x2qPJOm5bPv7VMv
         IEz+3ozJmMWTBd04ErA+L4wk/0PjyHp2gejrFY5Hp1yD2/uez5UT5BiJtnb2iaKP2/vs
         SMSQ9qo0pSxEIrRcKZjgoiC7AmF9J9UhdaxfOXmCw9U+Z7w4klykH6tQCy/7+4as4UVZ
         6dwxlkXGI1NYgtaY7Zu976/NOzffZXZNDeuwtcNtImP4kZT+274B4qypkT0Y1nH8llDD
         JsBWFcA+GtHbhUA2Dcnw5yiEJEg8239BHg+veY10eVi55Nn6heaw7SXMjo2wxSsUe+mj
         guyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lPlsXqCGHYagVYmxec3j/xxnK3oND8ckDanm4J5g6+s=;
        b=HXZUFd3N3xuFEaH1VfLMyhHBK1nThggmDe6CK9QQW7dl67IkoB13D3GVKyw92fIzp6
         +iFqfIm6BPByRd5PXro/r5GMdfVy2fa7s8sGzSncA6feqKhLRr+6sJQQXqlCAOfU5KTy
         V051Ry/HTvfuwH1jcoqemdiX9LmhtFCWiREk7qxBI4tuB97liYX5p2AsHQK27q1alkrL
         mPzYzxxz2mTYDsT1HLbdhv771HixEjLh+M8fdCK3mM/iSyoG3EMnPTzV34jVQuqnF4ZB
         Wlq5koTLDBl8/yBpOODF5+DP0w1UC97HMHb2MwVzd57Y5+eEQw51THY0MV4mklzJRHwi
         J+yg==
X-Gm-Message-State: AGi0Pubz5zJKvw/7J19P6b5RHmjDl+kmyHU8a5XLIo4CeifOB6qEBubT
        wJ3/iWIHpNg52EY31QqmnTwnxw==
X-Google-Smtp-Source: APiQypKrkeOBy7c9A/9ySH8hmTQpSPXDqk6tEE5oq0yFe5+sxi9L2pzoxp9Luyj6lNrqui3ig6qFsw==
X-Received: by 2002:adf:800e:: with SMTP id 14mr18882781wrk.369.1587399443572;
        Mon, 20 Apr 2020 09:17:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id s9sm1946164wrg.27.2020.04.20.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 09:17:22 -0700 (PDT)
Date:   Mon, 20 Apr 2020 17:17:20 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V5 2/4] backlight: qcom-wled: Add callback functions
Message-ID: <20200420161720.cuxponga4vxitrwi@holly.lan>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586274430-28402-3-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Apr 07, 2020 at 09:17:08PM +0530, Kiran Gunda wrote:
> Add wled_cabc_config, wled_sync_toggle, wled_ovp_fault_status
> and wled_ovp_delay and wled_auto_detection_required callback
> functions to prepare the driver for adding WLED5 support.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
