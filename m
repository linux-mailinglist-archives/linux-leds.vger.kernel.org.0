Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F69C29FA3E
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 02:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgJ3BHV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 21:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgJ3BHV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 21:07:21 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5ACC0613D2
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 18:07:20 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id v6so5693630lfa.13
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2020 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UL66Jvu0unFnQHvzD+yrX2vJU4SUteLOavhBLQABAN4=;
        b=DywXxuJbvX4JdeIAQM8rLDQ55TZyVFW68rLCpGM++7lZU0NkcNJRjPBU3Q7EvDI+W9
         754YxkIQFWGQGd2YMSVNFgDok9g1pqYivTRi68NCrW13sYBXG/FcN3YsUvVYAGs6kwUZ
         RXsj5z2St8miZfbTMZ+SrfDK7G9h8tkw2VRzgJhfCLJlbnCWrDf8ZGHIjNSxVdFdM3SB
         r1OT4goYzHnSAoJyRNz/gUhlAbcLlgSf6ozT+oraUhCYq3nGcglnPjFGkJFddXx/9f0q
         QIDK9rAWIcZhVuIpF3YX6BSe3x0bRKzIMm3KDV2tBwEA2oAybbPIxvqCMG0x7z33UDWF
         LLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UL66Jvu0unFnQHvzD+yrX2vJU4SUteLOavhBLQABAN4=;
        b=uU5Hmy6vGqGOlS3l+w1mkvH7IXn11Ti1BY0Q3dqZ3Jdp11smYU04SKL9bzNqJRbWka
         Tf0uxTOAK08DoPbVozJ0tcx0G7KEX1KsuHzaiAODMwvgX5aUIPgLiuS2uK2iPfN72uG/
         +DSmfcxL2MbC9MjriIJS1NnDEf8Y0dpsvAVZVYHB0aRRl8TVwMu/s2KNPF3zkb9NNMdT
         v27GcxVmYZ53zSH6D5cXLLH57Byh+xDZajvvdLm5z6gO7Zn+Exp4QMtnir2jCVl+V9uZ
         oqoYLhocYWLP5EIYsJvPCMnRsJZdyPCLipV/EDRG8xNwfnlrtOZXMFfE4XbLVayC2JBz
         EeGg==
X-Gm-Message-State: AOAM530Nd4QlH7InO3mE1/zCw5wF5W+X2hrltkRW5VkWy7tD04vXw97q
        IypsjKq70QMqPzyDcKwBfoC38NZFsFro4OO2
X-Google-Smtp-Source: ABdhPJxVnkcn0bP0CpdDM9gDXgCCHH7IbjyqQYXyNvieHuBfbONwn4wSw3zeUdtvK1ItqvQ2i0XrVw==
X-Received: by 2002:a19:c58:: with SMTP id 85mr2798895lfm.322.1604020038848;
        Thu, 29 Oct 2020 18:07:18 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id c6sm447130lfm.226.2020.10.29.18.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:07:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] Qualcomm LPG support for PM8150b/l
Date:   Fri, 30 Oct 2020 04:07:08 +0300
Message-Id: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patchset brings support for LPG blocks on Qualcomm's PM8150[BL]
PMIC chips, see [1]. PM8150L support was tested on RB5 platform.

This patchset can be folded into the aforementioned series, if Bjorn
would like to, or it can go as a separate instance.

Changes since v1:
 - Changed lpg data fields to use 'triled_has_foo_ctl' rather than
   'triled_no_foo_ctl'

[1] https://lore.kernel.org/linux-arm-msm/20201021201224.3430546-1-bjorn.andersson@linaro.org/



