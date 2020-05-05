Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809BB1C60AA
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2020 21:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgEETEO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 May 2020 15:04:14 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42255 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgEETEN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 May 2020 15:04:13 -0400
Received: by mail-ot1-f68.google.com with SMTP id m18so2616534otq.9;
        Tue, 05 May 2020 12:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ez2jZ5YWvWKk1xrc5GCCzcclQFVn2i3O0Z1QVwxg5FI=;
        b=g3DZn84OeRUG8jNd8/IeYMOL9t/isV/MbWAWk5N63VqO6nZMKiaF7n04514Bfa5OhE
         Ik62VxjsNMxdPM+4OKzAYf2yd9QrysKwg1SPxm4Lqnk3hlVWLiJzW7UZEOe5JYPOnlRY
         5/zQa26t6zPaU7OBKpDkupbwk/SC0UCzIH5C/Ud9QaBDVc2EACuu1JhlfGC12tnFl+VZ
         jZX/EM6sfroYFFFD5XOwiPXnE4VPOR37vFMiNBeXbVuzt4FgdJwUL86eSvDUU9nQh6fH
         oNp/H/A+WaqXoo7MI7004jv0n5lOJb90dEb6SxHSC45Y1vOk3cw3KU99UKmU1a/dwQPp
         axPw==
X-Gm-Message-State: AGi0PuZuERs71OytXu5G1m3tsaLOadTfuDKazCK9PqGgwK0ZIjvaHGFv
        pPZNHZSK/Majbpqth/9mUA==
X-Google-Smtp-Source: APiQypLUoaZRtev0sjEUdQ8Wn5budqzOQLwjk0QYb1YINN2vbjLc9NGTn4SK0zkfuNm90+AXolxkHg==
X-Received: by 2002:a9d:7d8a:: with SMTP id j10mr3878531otn.266.1588705452881;
        Tue, 05 May 2020 12:04:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k8sm400975oop.30.2020.05.05.12.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:04:12 -0700 (PDT)
Received: (nullmailer pid 13521 invoked by uid 1000);
        Tue, 05 May 2020 19:04:11 -0000
Date:   Tue, 5 May 2020 14:04:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200505190410.GA13452@bogus>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020 21:03:36 +0530, Kiran Gunda wrote:
> Add WLED5 specific bindings.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 59 ++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
