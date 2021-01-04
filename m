Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4C12E9ACC
	for <lists+linux-leds@lfdr.de>; Mon,  4 Jan 2021 17:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbhADQOD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Jan 2021 11:14:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbhADQOC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jan 2021 11:14:02 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F22C061795
        for <linux-leds@vger.kernel.org>; Mon,  4 Jan 2021 08:13:22 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id q22so16688117pfk.12
        for <linux-leds@vger.kernel.org>; Mon, 04 Jan 2021 08:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=XDfsTJvF8BHWT/MwLCJjoGuI8FbQRWjKjuVmDMQxU8M=;
        b=mVSg0/91IdSUQNfDZ1CuvV95N73XydEpcMZEkS9cLA7xrpuWEiKRa2CwBZBPaqSQbf
         ocOEQT2NMLlRGb0bYAlWV0tAEwWiBQT6oD0B3R2HBOzslWIJuKCKxOvRcA8YVg8RuZCJ
         d+vXwIENA93kVBVD0o4HxoNca6TMZj6dR+MSqlqg3SsF3LCbMyiItxYf45L2Fx9mIXCT
         EgYSdh8fowgKMvxdlF0b62BbRW/O/kTFqHWpWr2nu2pXEiS1+moU7WAnHxO4/Vxa9+fC
         DCn11syJR9zxjIk3rNxjyZn4kIqPwvbR2yyRVqEYwC7dBZ1wEJnAMiB02GypqSDIEU8r
         wvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=XDfsTJvF8BHWT/MwLCJjoGuI8FbQRWjKjuVmDMQxU8M=;
        b=etxzW5PcAiZtNng1qiZ9ZPFxia1mJNBoUS/6/c5RJxmXAnwup7AwrL9Y9F2nBgH+IN
         pkS1k4EesELv5zpM9iuHOoj/NieITBN6fIqQdvZyN8m2NQwcQQ4DzQyqFovTmLPFgBFv
         7cTDdVoiG7CUvkymt18aVkt3zKHnLv46WC+t834wPSuE6PsbtaX+30w/SafvDx2hJxva
         0biJvWuW2yhbwcJSqr4bjFqmr9SV069+tnKo/yhR3lhFWQvcndTV0qONKcJHoTnJxF7e
         OLU2ATT7rIN70RFa9WJWzdREiR8Zk8aqnqyMMtoajSPbJvbcFCNZXhdb85I1vhpl1pTF
         Oz8A==
X-Gm-Message-State: AOAM531N3ziq/Ql0t7mwXtZtGAkLabkcOYnHTd14pQIKToHYXhHi7lxs
        +MCNYz5T+Q/ECHntKbn92GWU6A==
X-Google-Smtp-Source: ABdhPJxiSbquKtEEXiVFyDA3gyCmMk8WaU6Pzjy6k497zwZtHFZ3/TlUj90UnzII6zSWOz9L7Y+WYQ==
X-Received: by 2002:a65:6659:: with SMTP id z25mr61934189pgv.427.1609776801878;
        Mon, 04 Jan 2021 08:13:21 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id q23sm57413879pfg.18.2021.01.04.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 08:13:21 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Alexander Dahl <post@lespocky.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v9 4/4] arm64: dts: meson: Fix schema warnings for pwm-leds
In-Reply-To: <20201228163217.32520-5-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-5-post@lespocky.de>
Date:   Mon, 04 Jan 2021 08:13:20 -0800
Message-ID: <7hv9ccn0in.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Alexander Dahl <post@lespocky.de> writes:

> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for 5.12,

Thanks,

Kevin
