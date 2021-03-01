Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44CC32833C
	for <lists+linux-leds@lfdr.de>; Mon,  1 Mar 2021 17:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237616AbhCAQOu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Mar 2021 11:14:50 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:51386 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237628AbhCAQLh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 1 Mar 2021 11:11:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614615082; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=o09V222UbtF+m7URYAndN7kvp3AxBbab4TCWrtmYtDo=; b=r+vrDgjr7zZfjJ/F2JETwSRXB+Az911rPowMgIlHyNJc4B+7fmR6rb68K08Xrd0qkAAbZukT
 a6dIUQtM4fN+b5rtix8lDO3V4GxEEW1RdT68ZHBCBva2uFNf0KTTz3rfabV1UG5oaoe8Kme+
 QOukq9Slf0U0/RUL+XqFsN3HBEM=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 603d12076bfdd67a00fd4ebd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 16:10:47
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 34096C43466; Mon,  1 Mar 2021 16:10:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E958AC433C6;
        Mon,  1 Mar 2021 16:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E958AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V4 0/2] Fix WLED FSC Sync and brightness Sync settings
Date:   Mon,  1 Mar 2021 21:40:28 +0530
Message-Id: <1614615030-12703-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series has the following two WLED fixes
 1. As per the current implementation, for WLED5, after
    the FSC (Full Scale Current) update the driver is incorrectly
    toggling the MOD_SYNC register instead of toggling the SYNC register.
    The patch 1/2 fixes this by toggling the SYNC register after
    FSC update.

 2. Currently, the sync bits are set-then-cleared after FSC and brightness
    update. As per hardware team recommendation the FSC and brightness sync
    takes place from clear-then-set transition of the sync bits.
    The patch 2/2 fies this issue.

Changes from V3:
  1. Updated the patch description as per Daneil's suggestion.
  2. Added Daniel's "Reviewed-by" tag for patch 2/2.
  3. Updated the cover letter to use "set" and "clear" properly.
 
Changes from V2:
  1. Added Daniel's "Reviewed-by" tag for patch 1/2.
  2. Updated the patch 2/2 description with "set" and "clear"
     terminology instead of "1" and "0".
  3. Updated the cover letter with "set" and "clear" terminology
     instead of "1" and "0".

Changes from V1:
  1. Updated the cover letter.
  2. Updated the description of the patches as per Daniel's suggestion.

Kiran Gunda (2):
  backlight: qcom-wled: Fix FSC update issue for WLED5
  backlight: qcom-wled: Correct the sync_toggle sequence

 drivers/video/backlight/qcom-wled.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

