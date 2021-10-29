Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F90B4402C1
	for <lists+linux-leds@lfdr.de>; Fri, 29 Oct 2021 21:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbhJ2TFN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 29 Oct 2021 15:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbhJ2TFM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 29 Oct 2021 15:05:12 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E15C061714
        for <linux-leds@vger.kernel.org>; Fri, 29 Oct 2021 12:02:43 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so14875577ote.8
        for <linux-leds@vger.kernel.org>; Fri, 29 Oct 2021 12:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=GpCIhA9+wByobLj7T+jx3wSH4gGS8i8uDhYC2c+0spk=;
        b=H40YBjSl24IpyRNc3tR66GsznVBBR73W06kOgCkhC7aRGCLDor1RpsqCxk8Mi5zLxU
         +ajnUrDPlbQHfzTz/5YT3x2kjitBtAxwmSEHw8CyAgPSRH5VjCKNATtDO0zGlfVfzNzH
         Zq+kUFRrMGBsFJM8P2xhzdu6PvKRPpCejAV4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=GpCIhA9+wByobLj7T+jx3wSH4gGS8i8uDhYC2c+0spk=;
        b=l2Lu60Xk8OjXOaD2+olEwBBkc+P6gA5ehU/ZPtxFv8oC9O+ss1n7mftrhARccA9n2U
         PXdAK8q//6EW3mjRf8dBZVjJpzIEZNmAyhDxDXxH+nwLGRdbxbLBKdrPsL1EDZi7MB6t
         v7lcX7wQEoUkdG9UslgxFBQLRfOaQocmOKSLQj//w/VU9dQU1mp6SLNWt30aTY6gvbMB
         R6YBqJmWbNLvwdATFYOOz8eGOd/8/ms2hRFr9MmAVBsgIvcz4PyFjM3zlTE7UHWbyOjZ
         RT2sNI4b4NFLedaYolWBShWFqZoK0+xG5CciOztbOITiNsVUvP26L8hKIVAMCgLRa3/l
         LepQ==
X-Gm-Message-State: AOAM5303OdkZiAj5g5UnfFyGjuqFbwr3/W2RFSd+HkyV0xZmtG3g2JY8
        SmWojBSFjdgnfhXkMSTgjAj8hp5CvndAVhG/XEThVw==
X-Google-Smtp-Source: ABdhPJwD5Ms7XyyP5ZQv+IuN7Q47sYd9whm72ehzsLFfBOZr7vCMUfWm6H/7b9AIUtvxagjeaRAhHVPH2FHST3pAUUk=
X-Received: by 2002:a05:6830:1290:: with SMTP id z16mr2795567otp.159.1635534163270;
 Fri, 29 Oct 2021 12:02:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:02:42 -0500
MIME-Version: 1.0
In-Reply-To: <1635507893-25490-5-git-send-email-quic_c_skakit@quicinc.com>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com> <1635507893-25490-5-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:02:42 -0500
Message-ID: <CAE-0n53u5mJSApfEn5t7PxRMDfwHBu3iLdDC0V1Brt-5K=YHyA@mail.gmail.com>
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: Enable pm8350c pwm for sc7280-idp2
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     mka@chromium.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting Satya Priya (2021-10-29 04:44:53)
> Enable pm8350c pmic pwm support for backlight on sc7280-idp2.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
